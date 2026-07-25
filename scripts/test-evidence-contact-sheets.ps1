#Requires -Version 5.1

[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$builder = Join-Path $PSScriptRoot 'build-evidence-contact-sheets.ps1'
if (-not (Test-Path -LiteralPath $builder -PathType Leaf)) {
    throw "Evidence contact-sheet builder is missing: $builder"
}

Add-Type -AssemblyName System.Drawing

function Assert-ExpectedScriptFailure {
    param(
        [Parameter(Mandatory = $true)]
        [scriptblock]$Action,

        [Parameter(Mandatory = $true)]
        [string]$ExpectedPattern,

        [Parameter(Mandatory = $true)]
        [string]$FailureMessage
    )

    $failed = $false
    $captured = @()
    try {
        $captured = @(& $Action *>&1)
    }
    catch {
        $failed = $true
        $captured += $_.Exception.Message
        if ($null -ne $_.ErrorDetails -and
            -not [string]::IsNullOrWhiteSpace($_.ErrorDetails.Message)) {
            $captured += $_.ErrorDetails.Message
        }
    }

    $text = (@($captured | ForEach-Object { [string]$_ }) -join "`n")
    if (-not $failed -or $text -notmatch $ExpectedPattern) {
        if ([string]::IsNullOrWhiteSpace($text)) {
            $text = '<no output>'
        }
        throw "$FailureMessage`nObserved output:`n$text"
    }
}
function New-TestImage {
    param(
        [Parameter(Mandatory = $true)][string]$Path,
        [Parameter(Mandatory = $true)][int]$Width,
        [Parameter(Mandatory = $true)][int]$Height,
        [Parameter(Mandatory = $true)][string]$Text
    )

    New-Item -ItemType Directory -Path (Split-Path -Parent $Path) -Force | Out-Null
    $bitmap = New-Object -TypeName Drawing.Bitmap -ArgumentList $Width, $Height
    $graphics = [Drawing.Graphics]::FromImage($bitmap)
    $font = New-Object -TypeName Drawing.Font -ArgumentList 'Segoe UI', 14
    $brush = New-Object -TypeName Drawing.SolidBrush -ArgumentList ([Drawing.Color]::Black)
    try {
        $graphics.Clear([Drawing.Color]::White)
        $graphics.DrawString($Text, $font, $brush, 10, 10)
        $bitmap.Save($Path, [Drawing.Imaging.ImageFormat]::Png)
    }
    finally {
        $brush.Dispose()
        $font.Dispose()
        $graphics.Dispose()
        $bitmap.Dispose()
    }
}

$tempBase = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
$tempRoot = Join-Path $tempBase ("dusk-contact-sheet-test-" + [Guid]::NewGuid().ToString('N'))
$inputRoot = Join-Path $tempRoot 'input'
$outputRoot = Join-Path $inputRoot 'derived/contact-sheets'

try {
    New-TestImage -Path (Join-Path $inputRoot 'run-a/windows/top.png') -Width 320 -Height 180 -Text 'top'
    New-TestImage -Path (Join-Path $inputRoot 'run-a/windows/middle.png') -Width 300 -Height 200 -Text 'middle'
    New-TestImage -Path (Join-Path $inputRoot 'run-a/windows/bottom.png') -Width 280 -Height 220 -Text 'bottom'
    Copy-Item -LiteralPath (Join-Path $inputRoot 'run-a/windows/top.png') -Destination (Join-Path $inputRoot 'run-a/windows/z-top-copy.png')
    New-TestImage -Path (Join-Path $inputRoot 'run-b/android/portrait.png') -Width 180 -Height 320 -Text 'portrait'
    New-TestImage -Path (Join-Path $inputRoot 'run-b/android/landscape.png') -Width 320 -Height 180 -Text 'landscape'

    $oldImage = Join-Path $inputRoot 'run-a/windows/top.png'
    (Get-Item -LiteralPath $oldImage).LastWriteTime = [datetime]'2026-07-25T05:00:00'
    $sourceHashesBefore = @{}
    Get-ChildItem -LiteralPath $inputRoot -Recurse -File -Filter '*.png' | ForEach-Object {
        $sourceHashesBefore[$_.FullName] = (Get-FileHash -LiteralPath $_.FullName -Algorithm SHA256).Hash
    }

    & powershell -NoProfile -File $builder `
        -InputRoot $inputRoot `
        -OutputRoot $outputRoot `
        -ImagesPerSheet 2 `
        -Columns 2 `
        -GroupDepth 1 `
        -DesktopExpectedResolution '320x180,300x200,280x220' `
        -AndroidExpectedResolution '180x320,320x180'
    if ($LASTEXITCODE -ne 0) {
        throw "Contact-sheet builder failed with exit code $LASTEXITCODE."
    }

    $sheetFiles = @(Get-ChildItem -LiteralPath $outputRoot -File -Filter '*__sheet-*.png')
    if ($sheetFiles.Count -ne 3) {
        throw "Expected 3 contact sheets, found $($sheetFiles.Count)."
    }

    $manifestPath = Join-Path $outputRoot 'contact-sheet-manifest.csv'
    $manifest = @(Import-Csv -LiteralPath $manifestPath)
    if ($manifest.Count -ne 6) {
        throw "Expected 6 manifest rows, found $($manifest.Count)."
    }

    $oldRow = $manifest | Where-Object { $_.RelativePath -match 'top\.png$' }
    if ($oldRow.ClassificationHint -ne 'diagnostic-only-default') {
        throw 'Pre-cutoff image did not receive the diagnostic-only classification hint.'
    }
    if ($oldRow.Orientation -ne 'landscape') {
        throw 'Landscape orientation was not recorded for the test image.'
    }
    if ($oldRow.PlatformHint -ne 'desktop' -or $oldRow.ResolutionStatus -ne 'pass') {
        throw 'Desktop platform or configured resolution was not recorded as passing.'
    }
    $portraitRow = $manifest | Where-Object { $_.RelativePath -match 'portrait\.png$' }
    if ($portraitRow.PlatformHint -ne 'android' -or $portraitRow.ResolutionStatus -ne 'pass') {
        throw 'Android platform or configured resolution was not recorded as passing.'
    }
    if ([string]::IsNullOrWhiteSpace($oldRow.Sha256)) {
        throw 'SHA-256 was not recorded for the original image.'
    }

    $duplicateRow = $manifest | Where-Object { $_.RelativePath -match 'z-top-copy\.png$' }
    if ($duplicateRow.DuplicateOf -notmatch 'top\.png$') {
        throw 'Exact duplicate relationship was not recorded.'
    }
    if ($duplicateRow.Sha256 -ne $oldRow.Sha256) {
        throw 'Exact duplicate images did not receive the same SHA-256.'
    }

    foreach ($entry in $sourceHashesBefore.GetEnumerator()) {
        $after = (Get-FileHash -LiteralPath $entry.Key -Algorithm SHA256).Hash
        if ($after -ne $entry.Value) {
            throw "Source image changed: $($entry.Key)"
        }
    }

    & powershell -NoProfile -File $builder `
        -InputRoot $inputRoot `
        -OutputRoot $outputRoot `
        -ImagesPerSheet 2 `
        -Columns 2 `
        -GroupDepth 1 `
        -DesktopExpectedResolution '320x180,300x200,280x220' `
        -AndroidExpectedResolution '180x320,320x180'
    if ($LASTEXITCODE -ne 0) {
        throw "Contact-sheet rerun failed with exit code $LASTEXITCODE."
    }
    $rerunManifest = @(Import-Csv -LiteralPath $manifestPath)
    if ($rerunManifest.Count -ne 6) {
        throw "Generated contact sheets were re-ingested on rerun; expected 6 rows, found $($rerunManifest.Count)."
    }

    Assert-ExpectedScriptFailure `
        -ExpectedPattern 'Resolution policy failed' `
        -FailureMessage 'Resolution mismatch policy did not reject nonconforming screenshots.' `
        -Action {
            & $builder `
                -InputRoot $inputRoot `
                -OutputRoot $outputRoot `
                -DesktopExpectedResolution '1920x1040' `
                -AndroidExpectedResolution '1600x800' `
                -FailOnResolutionMismatch
        }
    $mismatchManifest = @(Import-Csv -LiteralPath $manifestPath)
    if (@($mismatchManifest | Where-Object { $_.ResolutionStatus -eq 'mismatch' }).Count -ne 6) {
        throw 'Resolution mismatch rows were not retained in the manifest.'
    }

    Assert-ExpectedScriptFailure `
        -ExpectedPattern 'exceeds MaximumImages' `
        -FailureMessage 'MaximumImages guard did not reject an oversized input set.' `
        -Action {
            & $builder `
                -InputRoot $inputRoot `
                -OutputRoot $outputRoot `
                -MaximumImages 5
        }
    if (-not (Test-Path -LiteralPath $manifestPath -PathType Leaf)) {
        throw 'A failed bounded rerun removed the previously generated manifest.'
    }

    $vaultTree = Join-Path $tempRoot 'vault-tree'
    New-Item -ItemType Directory -Path (Join-Path $vaultTree '.obsidian') -Force | Out-Null
    New-TestImage -Path (Join-Path $vaultTree 'screenshots/test.png') -Width 200 -Height 120 -Text 'vault tree'
    Assert-ExpectedScriptFailure `
        -ExpectedPattern 'contains an Obsidian vault tree' `
        -FailureMessage 'Vault-tree guard did not reject an input containing .obsidian.' `
        -Action {
            & $builder `
                -InputRoot $vaultTree `
                -OutputRoot (Join-Path $tempRoot 'vault-tree-output')
        }

    $discoveryRoot = Join-Path $tempRoot 'discovery-tree'
    New-TestImage -Path (Join-Path $discoveryRoot 'screenshots/root.png') -Width 240 -Height 140 -Text 'root evidence'
    New-TestImage -Path (Join-Path $discoveryRoot 'run/evidence/network.png') -Width 240 -Height 140 -Text 'network evidence'
    New-TestImage -Path (Join-Path $discoveryRoot 'vault/.obsidian/assets/ignored.png') -Width 240 -Height 140 -Text 'ignored config'
    New-TestImage -Path (Join-Path $discoveryRoot 'vault/SYSTEM/MEDIA/ignored.png') -Width 240 -Height 140 -Text 'ignored vault media'
    $discoveryOutput = Join-Path $tempRoot 'discovery-output'
    & powershell -NoProfile -File $builder `
        -InputRoot $discoveryRoot `
        -OutputRoot $discoveryOutput `
        -DiscoverEvidenceSets
    if ($LASTEXITCODE -ne 0) {
        throw "Discovery-mode contact-sheet builder failed with exit code $LASTEXITCODE."
    }
    $discoveryManifest = @(Import-Csv -LiteralPath (Join-Path $discoveryOutput 'contact-sheet-manifest.csv'))
    if ($discoveryManifest.Count -ne 2) {
        throw "Discovery mode expected 2 evidence images, found $($discoveryManifest.Count)."
    }
    if (@($discoveryManifest | Where-Object { $_.RelativePath -match '(?:\.obsidian|SYSTEM[\/]MEDIA)' }).Count -ne 0) {
        throw 'Discovery mode ingested vault configuration or media images.'
    }

    Assert-ExpectedScriptFailure `
        -ExpectedPattern 'Platform classification failed' `
        -FailureMessage 'Required platform classification did not reject ambiguous evidence names.' `
        -Action {
            & $builder `
                -InputRoot $discoveryRoot `
                -OutputRoot $discoveryOutput `
                -DiscoverEvidenceSets `
                -RequirePlatformClassification
        }

    Write-Host 'Evidence contact-sheet tests passed: 13 cases.'
}
finally {
    $resolved = [IO.Path]::GetFullPath($tempRoot)
    if ($resolved.StartsWith($tempBase, [StringComparison]::OrdinalIgnoreCase) -and
        (Test-Path -LiteralPath $resolved)) {
        Remove-Item -LiteralPath $resolved -Recurse -Force
    }
}
