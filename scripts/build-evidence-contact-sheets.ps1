#Requires -Version 5.1

[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$InputRoot,

    [Parameter(Mandatory = $true)]
    [string]$OutputRoot,

    [ValidateRange(1, 20)]
    [int]$ImagesPerSheet = 6,

    [ValidateRange(1, 6)]
    [int]$Columns = 3,

    [ValidateRange(160, 1200)]
    [int]$ThumbnailWidth = 480,

    [ValidateRange(120, 900)]
    [int]$ThumbnailHeight = 270,

    [ValidateRange(40, 180)]
    [int]$LabelHeight = 72,

    [ValidateRange(1, 8)]
    [int]$GroupDepth = 2,

    [ValidateRange(1, 5000)]
    [int]$MaximumImages = 500,

    [datetime]$DiagnosticCutoff = [datetime]'2026-07-25T06:00:00',

    [switch]$DiscoverEvidenceSets,

    [switch]$AllowVaultTrees,

    [string[]]$DesktopExpectedResolution = @(),

    [string[]]$AndroidExpectedResolution = @(),

    [switch]$FailOnResolutionMismatch,

    [switch]$RequirePlatformClassification
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Get-RelativePathCompat {
    param(
        [Parameter(Mandatory = $true)][string]$BasePath,
        [Parameter(Mandatory = $true)][string]$TargetPath
    )

    $baseFull = [IO.Path]::GetFullPath($BasePath).TrimEnd([IO.Path]::DirectorySeparatorChar) + [IO.Path]::DirectorySeparatorChar
    $targetFull = [IO.Path]::GetFullPath($TargetPath)
    $baseUri = New-Object System.Uri -ArgumentList $baseFull
    $targetUri = New-Object System.Uri -ArgumentList $targetFull
    return [Uri]::UnescapeDataString($baseUri.MakeRelativeUri($targetUri).ToString()).Replace('/', [IO.Path]::DirectorySeparatorChar)
}

function Get-GroupKey {
    param([Parameter(Mandatory = $true)][string]$RelativePath)

    $directory = Split-Path -Parent $RelativePath
    if ([string]::IsNullOrWhiteSpace($directory)) {
        return 'root'
    }

    $parts = @($directory -split '[\\/]')
    $take = [Math]::Min($GroupDepth, $parts.Count)
    return ($parts[0..($take - 1)] -join '/')
}

function Get-SafeFileStem {
    param([Parameter(Mandatory = $true)][string]$Value)

    $safe = [regex]::Replace($Value, '[^A-Za-z0-9._-]+', '-')
    $safe = $safe.Trim('-')
    if ([string]::IsNullOrWhiteSpace($safe)) {
        return 'root'
    }
    return $safe
}

function Get-TruncatedLabel {
    param(
        [Parameter(Mandatory = $true)][string]$Value,
        [int]$MaximumLength = 92
    )

    if ($Value.Length -le $MaximumLength) {
        return $Value
    }
    return $Value.Substring(0, $MaximumLength - 3) + '...'
}


function ConvertTo-ResolutionSet {
    param(
        [Parameter(Mandatory = $true)]
        [AllowEmptyCollection()]
        [string[]]$Values,
        [Parameter(Mandatory = $true)][string]$ParameterName
    )

    $set = New-Object 'System.Collections.Generic.HashSet[string]' -ArgumentList ([StringComparer]::OrdinalIgnoreCase)
    foreach ($rawValue in $Values) {
        foreach ($value in @($rawValue -split '[,;]')) {
            if ([string]::IsNullOrWhiteSpace($value)) {
                continue
            }
            if ($value -notmatch '^\s*(\d+)\s*[xX]\s*(\d+)\s*$') {
                throw "$ParameterName contains an invalid resolution '$value'. Use WIDTHxHEIGHT values separated by commas, for example 1920x1040,1365x768."
            }
            $normalized = '{0}x{1}' -f [int]$Matches[1], [int]$Matches[2]
            $null = $set.Add($normalized)
        }
    }
    return ,$set
}

function Get-PlatformHint {
    param([Parameter(Mandatory = $true)][string]$RelativePath)

    $normalized = $RelativePath.ToLowerInvariant()
    if ($normalized -match '(^|[\\/_. -])(android|mobile)([\\/_. -]|$)') {
        return 'android'
    }
    if ($normalized -match '(^|[\\/_. -])(desktop|windows|win|pc)([\\/_. -]|$)') {
        return 'desktop'
    }
    return 'unclassified'
}

if (-not (Test-Path -LiteralPath $InputRoot -PathType Container)) {
    throw "InputRoot is not an existing directory: $InputRoot"
}

$inputPath = (Resolve-Path -LiteralPath $InputRoot).Path
$desktopResolutionSet = ConvertTo-ResolutionSet -Values $DesktopExpectedResolution -ParameterName 'DesktopExpectedResolution'
$androidResolutionSet = ConvertTo-ResolutionSet -Values $AndroidExpectedResolution -ParameterName 'AndroidExpectedResolution'
New-Item -ItemType Directory -Path $OutputRoot -Force | Out-Null
$outputPath = (Resolve-Path -LiteralPath $OutputRoot).Path
if ($inputPath -eq $outputPath) {
    throw 'OutputRoot must not be the same directory as InputRoot.'
}

if (-not $AllowVaultTrees -and -not $DiscoverEvidenceSets) {
    $vaultMarker = Get-ChildItem -LiteralPath $inputPath -Directory -Recurse -Force -Filter '.obsidian' -ErrorAction SilentlyContinue |
        Select-Object -First 1
    if ($null -ne $vaultMarker) {
        throw 'InputRoot contains an Obsidian vault tree. Point InputRoot at a screenshots/evidence directory, or pass -AllowVaultTrees only when vault media is intentionally in scope.'
    }
}

Add-Type -AssemblyName System.Drawing

$supportedExtensions = New-Object 'System.Collections.Generic.HashSet[string]' -ArgumentList ([StringComparer]::OrdinalIgnoreCase)
foreach ($extension in @('.png', '.jpg', '.jpeg', '.bmp', '.gif')) {
    $null = $supportedExtensions.Add($extension)
}

$images = @(
    Get-ChildItem -LiteralPath $inputPath -Recurse -Force -File |
        Where-Object {
            $supportedExtensions.Contains($_.Extension) -and
            -not $_.FullName.StartsWith($outputPath + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase)
        } |
        ForEach-Object {
            $relativePath = Get-RelativePathCompat -BasePath $inputPath -TargetPath $_.FullName
            $segments = @($relativePath -split '[\\/]')
            $insideEvidenceSet = @($segments | Where-Object { $_ -in @('screenshots', 'evidence') }).Count -gt 0
            $insideVaultConfig = @($segments | Where-Object { $_ -eq '.obsidian' }).Count -gt 0
            $include = -not $DiscoverEvidenceSets -or ($insideEvidenceSet -and -not $insideVaultConfig)
            if ($include) {
                [pscustomobject]@{
                    File = $_
                    RelativePath = $relativePath
                    GroupKey = Get-GroupKey -RelativePath $relativePath
                    Sha256 = ''
                }
            }
        } |
        Sort-Object GroupKey, RelativePath
)

if ($images.Count -eq 0) {
    throw "No supported images were found under: $inputPath"
}
if ($images.Count -gt $MaximumImages) {
    throw "Image count $($images.Count) exceeds MaximumImages $MaximumImages. Choose a narrower screenshot root or raise the limit explicitly."
}

Get-ChildItem -LiteralPath $outputPath -File -Force -ErrorAction SilentlyContinue |
    Where-Object {
        $_.Name -match '__sheet-\d{3}\.png$' -or
        $_.Name -in @('contact-sheet-manifest.csv', 'contact-sheet-summary.json')
    } |
    Remove-Item -Force

foreach ($image in $images) {
    $image.Sha256 = (Get-FileHash -LiteralPath $image.File.FullName -Algorithm SHA256).Hash
}

$firstPathByHash = New-Object 'System.Collections.Generic.Dictionary[string,string]' -ArgumentList ([StringComparer]::OrdinalIgnoreCase)
foreach ($image in $images) {
    if (-not $firstPathByHash.ContainsKey($image.Sha256)) {
        $firstPathByHash[$image.Sha256] = $image.RelativePath
    }
}

$tilePadding = 12
$headerHeight = 54
$tileWidth = $ThumbnailWidth + ($tilePadding * 2)
$tileHeight = $ThumbnailHeight + $LabelHeight + ($tilePadding * 2)
$manifest = New-Object 'System.Collections.Generic.List[object]'
$sheetCount = 0
$groupNumber = 0

$headerFont = New-Object -TypeName Drawing.Font -ArgumentList 'Segoe UI', 14, ([Drawing.FontStyle]::Bold)
$labelFont = New-Object -TypeName Drawing.Font -ArgumentList 'Segoe UI', 9, ([Drawing.FontStyle]::Regular)
$headerBrush = New-Object -TypeName Drawing.SolidBrush -ArgumentList ([Drawing.Color]::FromArgb(32, 32, 32))
$labelBrush = New-Object -TypeName Drawing.SolidBrush -ArgumentList ([Drawing.Color]::FromArgb(24, 24, 24))
$tileBrush = New-Object -TypeName Drawing.SolidBrush -ArgumentList ([Drawing.Color]::FromArgb(245, 245, 245))
$borderPen = New-Object -TypeName Drawing.Pen -ArgumentList ([Drawing.Color]::FromArgb(180, 180, 180)), 1
$format = New-Object Drawing.StringFormat
$format.Trimming = [Drawing.StringTrimming]::EllipsisCharacter
$format.FormatFlags = [Drawing.StringFormatFlags]::LineLimit

try {
    foreach ($group in @($images | Group-Object GroupKey)) {
        $groupNumber++
        $groupItems = @($group.Group)
        $groupSheetCount = [int][Math]::Ceiling($groupItems.Count / [double]$ImagesPerSheet)
        $groupStem = Get-SafeFileStem -Value $group.Name

        for ($sheetIndex = 0; $sheetIndex -lt $groupSheetCount; $sheetIndex++) {
            $start = $sheetIndex * $ImagesPerSheet
            $end = [Math]::Min($start + $ImagesPerSheet - 1, $groupItems.Count - 1)
            $sheetItems = @($groupItems[$start..$end])
            $rows = [int][Math]::Ceiling($sheetItems.Count / [double]$Columns)
            $sheetWidth = $tileWidth * $Columns
            $sheetHeight = $headerHeight + ($tileHeight * $rows)
            $sheetCount++

            $sheetName = 'group-{0:D3}__{1}__sheet-{2:D3}.png' -f $groupNumber, $groupStem, ($sheetIndex + 1)
            $sheetPath = Join-Path $outputPath $sheetName
            $bitmap = New-Object -TypeName Drawing.Bitmap -ArgumentList $sheetWidth, $sheetHeight
            $graphics = [Drawing.Graphics]::FromImage($bitmap)

            try {
                $graphics.Clear([Drawing.Color]::White)
                $graphics.InterpolationMode = [Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
                $graphics.PixelOffsetMode = [Drawing.Drawing2D.PixelOffsetMode]::HighQuality
                $graphics.SmoothingMode = [Drawing.Drawing2D.SmoothingMode]::HighQuality
                $graphics.TextRenderingHint = [Drawing.Text.TextRenderingHint]::ClearTypeGridFit

                $headerText = '{0} | sheet {1}/{2} | {3} image(s)' -f $group.Name, ($sheetIndex + 1), $groupSheetCount, $sheetItems.Count
                $graphics.DrawString($headerText, $headerFont, $headerBrush, 12, 14)

                for ($itemIndex = 0; $itemIndex -lt $sheetItems.Count; $itemIndex++) {
                    $item = $sheetItems[$itemIndex]
                    $column = $itemIndex % $Columns
                    $row = [int][Math]::Floor($itemIndex / [double]$Columns)
                    $tileX = $column * $tileWidth
                    $tileY = $headerHeight + ($row * $tileHeight)
                    $imageX = $tileX + $tilePadding
                    $imageY = $tileY + $tilePadding
                    $labelY = $imageY + $ThumbnailHeight + 6
                    $status = 'ok'
                    $width = 0
                    $height = 0
                    $stream = $null
                    $sourceImage = $null

                    $graphics.FillRectangle($tileBrush, $tileX, $tileY, $tileWidth, $tileHeight)
                    $graphics.DrawRectangle($borderPen, $tileX, $tileY, $tileWidth - 1, $tileHeight - 1)

                    try {
                        $stream = [IO.File]::Open($item.File.FullName, [IO.FileMode]::Open, [IO.FileAccess]::Read, [IO.FileShare]::ReadWrite)
                        $sourceImage = [Drawing.Image]::FromStream($stream, $true, $true)
                        $width = $sourceImage.Width
                        $height = $sourceImage.Height
                        $scale = [Math]::Min($ThumbnailWidth / [double]$width, $ThumbnailHeight / [double]$height)
                        $drawWidth = [int][Math]::Max(1, [Math]::Round($width * $scale))
                        $drawHeight = [int][Math]::Max(1, [Math]::Round($height * $scale))
                        $drawX = $imageX + [int][Math]::Floor(($ThumbnailWidth - $drawWidth) / 2)
                        $drawY = $imageY + [int][Math]::Floor(($ThumbnailHeight - $drawHeight) / 2)
                        $graphics.DrawImage($sourceImage, $drawX, $drawY, $drawWidth, $drawHeight)
                    }
                    catch {
                        $status = 'unreadable'
                    }
                    finally {
                        if ($null -ne $sourceImage) { $sourceImage.Dispose() }
                        if ($null -ne $stream) { $stream.Dispose() }
                    }

                    $classificationHint = if ($item.File.LastWriteTime -lt $DiagnosticCutoff) {
                        'diagnostic-only-default'
                    }
                    else {
                        'unclassified'
                    }
                    $orientation = if ($width -eq 0 -or $height -eq 0) {
                        'unknown'
                    }
                    elseif ($width -gt $height) {
                        'landscape'
                    }
                    elseif ($height -gt $width) {
                        'portrait'
                    }
                    else {
                        'square'
                    }
                    $platformHint = Get-PlatformHint -RelativePath $item.RelativePath
                    $actualResolution = if ($width -gt 0 -and $height -gt 0) { '{0}x{1}' -f $width, $height } else { '' }
                    $expectedResolutionSet = $null
                    if ($platformHint -eq 'desktop') {
                        $expectedResolutionSet = $desktopResolutionSet
                    }
                    elseif ($platformHint -eq 'android') {
                        $expectedResolutionSet = $androidResolutionSet
                    }

                    if ($status -ne 'ok') {
                        $resolutionStatus = 'unreadable'
                    }
                    elseif ($platformHint -eq 'unclassified') {
                        $resolutionStatus = if ($RequirePlatformClassification) { 'unclassified-platform' } else { 'not-checked' }
                    }
                    elseif ($null -eq $expectedResolutionSet -or $expectedResolutionSet.Count -eq 0) {
                        $resolutionStatus = 'not-configured'
                    }
                    elseif ($expectedResolutionSet.Contains($actualResolution)) {
                        $resolutionStatus = 'pass'
                    }
                    else {
                        $resolutionStatus = 'mismatch'
                    }

                    $expectedResolution = if ($null -eq $expectedResolutionSet -or $expectedResolutionSet.Count -eq 0) {
                        ''
                    }
                    else {
                        (@($expectedResolutionSet) | Sort-Object) -join ';'
                    }

                    $firstPath = $firstPathByHash[$item.Sha256]
                    $duplicateOf = if ($firstPath -eq $item.RelativePath) { '' } else { $firstPath }
                    $duplicateLabel = if ([string]::IsNullOrWhiteSpace($duplicateOf)) { 'unique' } else { 'duplicate' }
                    $label = "{0}`n{1:yyyy-MM-dd HH:mm:ss} | {2}x{3} {4} | {5} {6} | {7} | {8} | {9}" -f (
                        Get-TruncatedLabel -Value $item.RelativePath
                    ), $item.File.LastWriteTime, $width, $height, $orientation, $platformHint, $resolutionStatus, $classificationHint, $duplicateLabel, $status
                    $labelRect = New-Object -TypeName Drawing.RectangleF -ArgumentList $imageX, $labelY, $ThumbnailWidth, ($LabelHeight - 6)
                    $graphics.DrawString($label, $labelFont, $labelBrush, $labelRect, $format)

                    $manifest.Add([pscustomobject]@{
                        Sheet = $sheetName
                        SheetIndex = $sheetIndex + 1
                        TileIndex = $itemIndex + 1
                        Group = $group.Name
                        RelativePath = $item.RelativePath
                        LastWriteTime = $item.File.LastWriteTime.ToString('o')
                        Width = $width
                        Height = $height
                        Orientation = $orientation
                        PlatformHint = $platformHint
                        ActualResolution = $actualResolution
                        ExpectedResolution = $expectedResolution
                        ResolutionStatus = $resolutionStatus
                        SourceBytes = $item.File.Length
                        Sha256 = $item.Sha256
                        DuplicateOf = $duplicateOf
                        ClassificationHint = $classificationHint
                        ReadStatus = $status
                    }) | Out-Null
                }

                $bitmap.Save($sheetPath, [Drawing.Imaging.ImageFormat]::Png)
            }
            finally {
                $graphics.Dispose()
                $bitmap.Dispose()
            }
        }
    }
}
finally {
    $format.Dispose()
    $borderPen.Dispose()
    $tileBrush.Dispose()
    $labelBrush.Dispose()
    $headerBrush.Dispose()
    $labelFont.Dispose()
    $headerFont.Dispose()
}

$manifestPath = Join-Path $outputPath 'contact-sheet-manifest.csv'
$manifest | Export-Csv -LiteralPath $manifestPath -NoTypeInformation -Encoding UTF8

$summary = [ordered]@{
    inputRoot = $inputPath
    outputRoot = $outputPath
    generatedAt = (Get-Date).ToString('o')
    imageCount = $images.Count
    sheetCount = $sheetCount
    groupCount = @($images | Group-Object GroupKey).Count
    imagesPerSheet = $ImagesPerSheet
    maximumImages = $MaximumImages
    columns = $Columns
    diagnosticCutoff = $DiagnosticCutoff.ToString('o')
    discoverEvidenceSets = [bool]$DiscoverEvidenceSets
    desktopExpectedResolution = @($desktopResolutionSet | Sort-Object)
    androidExpectedResolution = @($androidResolutionSet | Sort-Object)
    resolutionMismatchCount = @($manifest | Where-Object { $_.ResolutionStatus -eq 'mismatch' }).Count
    resolutionPolicyMissingCount = @($manifest | Where-Object { $_.ResolutionStatus -eq 'not-configured' }).Count
    unclassifiedPlatformCount = @($manifest | Where-Object { $_.ResolutionStatus -eq 'unclassified-platform' }).Count
    policy = 'Contact sheets are triage aids. Pixel dimensions do not prove that an Obsidian window was maximized. Final findings and acceptance must cite and inspect original images.'
}
$summary | ConvertTo-Json -Depth 5 | Set-Content -LiteralPath (Join-Path $outputPath 'contact-sheet-summary.json') -Encoding UTF8

Write-Host "Evidence contact sheets created: $sheetCount sheet(s), $($images.Count) image(s)."
Write-Host "Manifest: $manifestPath"

$resolutionPolicyFailures = @($manifest | Where-Object { $_.ResolutionStatus -in @('mismatch', 'not-configured') })
$unclassifiedPlatforms = @($manifest | Where-Object { $_.ResolutionStatus -eq 'unclassified-platform' })
if ($FailOnResolutionMismatch -and $resolutionPolicyFailures.Count -gt 0) {
    throw "Resolution policy failed: $($resolutionPolicyFailures.Count) image(s) were mismatched or lacked a configured platform resolution. Inspect $manifestPath."
}
if ($RequirePlatformClassification -and $unclassifiedPlatforms.Count -gt 0) {
    throw "Platform classification failed: $($unclassifiedPlatforms.Count) image(s) could not be classified as desktop or Android. Inspect $manifestPath."
}
