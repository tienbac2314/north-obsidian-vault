#Requires -Version 5.1

[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$VaultPath,

    [string]$ExpectedDailyDateFormat = '',

    [string[]]$RequiredRoots = @(
        'DAILY',
        'HUB',
        'PARA',
        'STICKY',
        'SYSTEM',
        'ZETA'
    ),

    [string[]]$RequiredDisabledCommunityPlugins = @(
        'digitalgarden',
        'meld-encrypt',
        'obsidian42-brat',
        'obsidian-custom-frames',
        'share-note',
        'todoist-sync-plugin'
    ),

    [string[]]$RequiredDisabledCorePlugins = @(
        'publish',
        'sync'
    ),

    [switch]$SkipSafeEndState
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

if ($VaultPath.IndexOfAny([char[]]'<>') -ge 0) {
    throw 'VaultPath contains placeholder characters. Supply the full path to a real disposable vault.'
}
if ($ExpectedDailyDateFormat.IndexOfAny([char[]]'<>') -ge 0) {
    throw 'ExpectedDailyDateFormat contains placeholder characters. Supply the reproduced format or omit this parameter.'
}

$failures = New-Object 'System.Collections.Generic.List[string]'
$checks = 0

function Add-Check {
    $script:checks += 1
}

function Add-Failure {
    param([Parameter(Mandatory = $true)][string]$Message)

    $script:failures.Add($Message) | Out-Null
}

function Test-ObjectProperty {
    param(
        [AllowNull()]$Object,
        [Parameter(Mandatory = $true)][string]$Name
    )

    if ($null -eq $Object) {
        return $false
    }

    return $null -ne $Object.PSObject.Properties[$Name]
}

function Get-StringProperty {
    param(
        [AllowNull()]$Object,
        [Parameter(Mandatory = $true)][string]$Name
    )

    if (-not (Test-ObjectProperty -Object $Object -Name $Name)) {
        return ''
    }

    return [string]$Object.$Name
}

function Read-JsonFile {
    param(
        [Parameter(Mandatory = $true)][string]$Path,
        [Parameter(Mandatory = $true)][string]$Label
    )

    Add-Check
    if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) {
        Add-Failure "$Label is missing."
        return $null
    }

    try {
        return Get-Content -LiteralPath $Path -Raw -Encoding UTF8 | ConvertFrom-Json
    }
    catch {
        Add-Failure "$Label is not valid JSON."
        return $null
    }
}

function Get-StaticRelativePath {
    param([AllowEmptyString()][string]$RelativePath)

    if ([string]::IsNullOrWhiteSpace($RelativePath)) {
        return ''
    }

    $normalized = $RelativePath.Replace('\', '/').Trim()
    while ($normalized.StartsWith('./', [StringComparison]::Ordinal)) {
        $normalized = $normalized.Substring(2)
    }

    $tokenIndex = $normalized.IndexOf('{{', [StringComparison]::Ordinal)
    if ($tokenIndex -ge 0) {
        $normalized = $normalized.Substring(0, $tokenIndex)
    }

    return $normalized.Trim('/')
}

function Resolve-SafeVaultPath {
    param(
        [AllowEmptyString()][string]$RelativePath,
        [Parameter(Mandatory = $true)][string]$Context
    )

    $staticRelativePath = Get-StaticRelativePath -RelativePath $RelativePath
    if ([string]::IsNullOrWhiteSpace($staticRelativePath)) {
        Add-Failure "$Context has an empty path."
        return $null
    }

    if ([IO.Path]::IsPathRooted($staticRelativePath) -or
        $staticRelativePath -match '(^|/)\.\.(/|$)') {
        Add-Failure "$Context escapes the vault root."
        return $null
    }

    $platformRelativePath = $staticRelativePath.Replace(
        '/',
        [IO.Path]::DirectorySeparatorChar
    )
    $resolved = [IO.Path]::GetFullPath((Join-Path $script:vaultRoot $platformRelativePath))
    $vaultPrefix = $script:vaultRoot.TrimEnd(
        [IO.Path]::DirectorySeparatorChar,
        [IO.Path]::AltDirectorySeparatorChar
    ) + [IO.Path]::DirectorySeparatorChar

    if ($resolved -ne $script:vaultRoot -and
        -not $resolved.StartsWith($vaultPrefix, [StringComparison]::OrdinalIgnoreCase)) {
        Add-Failure "$Context resolves outside the vault root."
        return $null
    }

    return $resolved
}

function Assert-VaultDirectory {
    param(
        [AllowEmptyString()][string]$RelativePath,
        [Parameter(Mandatory = $true)][string]$Context
    )

    Add-Check
    $resolved = Resolve-SafeVaultPath -RelativePath $RelativePath -Context $Context
    if ($null -ne $resolved -and
        -not (Test-Path -LiteralPath $resolved -PathType Container)) {
        Add-Failure "$Context does not resolve to an existing vault directory."
    }
}

function Assert-VaultFile {
    param(
        [AllowEmptyString()][string]$RelativePath,
        [Parameter(Mandatory = $true)][string]$Context,
        [switch]$AppendMarkdownExtension
    )

    $candidate = $RelativePath
    if ($AppendMarkdownExtension -and
        -not [string]::IsNullOrWhiteSpace($candidate) -and
        [string]::IsNullOrWhiteSpace([IO.Path]::GetExtension($candidate))) {
        $candidate += '.md'
    }

    Add-Check
    $resolved = Resolve-SafeVaultPath -RelativePath $candidate -Context $Context
    if ($null -ne $resolved -and
        -not (Test-Path -LiteralPath $resolved -PathType Leaf)) {
        Add-Failure "$Context does not resolve to an existing vault file."
    }
}

function Get-JsonCommandIds {
    param([AllowNull()]$Value)

    $results = New-Object 'System.Collections.Generic.List[string]'

    function Visit-JsonValue {
        param([AllowNull()]$Current)

        if ($null -eq $Current) {
            return
        }

        if ($Current -is [System.Collections.IEnumerable] -and
            $Current -isnot [string] -and
            $Current -isnot [pscustomobject]) {
            foreach ($item in $Current) {
                Visit-JsonValue -Current $item
            }
            return
        }

        if ($Current -is [pscustomobject]) {
            foreach ($property in $Current.PSObject.Properties) {
                if ($property.Name -eq 'commandId' -and
                    $property.Value -is [string] -and
                    -not [string]::IsNullOrWhiteSpace($property.Value)) {
                    $results.Add($property.Value.Trim()) | Out-Null
                }
                else {
                    Visit-JsonValue -Current $property.Value
                }
            }
        }
    }

    Visit-JsonValue -Current $Value
    return $results.ToArray()
}

function Get-JournalsCommandSlug {
    param([AllowEmptyString()][string]$Value)

    if ([string]::IsNullOrWhiteSpace($Value)) {
        return ''
    }

    return ([regex]::Replace($Value.Trim(), '\s', '-')).ToLowerInvariant()
}

function Add-CurrentJournalsCommand {
    param(
        [Parameter(Mandatory = $true)][string]$JournalName,
        [Parameter(Mandatory = $true)][string]$CommandName
    )

    $journalSlug = Get-JournalsCommandSlug -Value $JournalName
    $commandSlug = Get-JournalsCommandSlug -Value $CommandName
    if ([string]::IsNullOrWhiteSpace($journalSlug) -or
        [string]::IsNullOrWhiteSpace($commandSlug)) {
        return
    }

    $null = $script:knownCommands.Add("journals:${journalSlug}:${commandSlug}")
}

function Test-SupportedCommandReference {
    param(
        [Parameter(Mandatory = $true)][string]$CommandId,
        [Parameter(Mandatory = $true)][string]$Context
    )

    $supportedPrefixes = @(
        'journals:',
        'obsidian-hotkeys-for-specific-files:',
        'quickadd:choice:',
        'templater-obsidian:'
    )

    $isSupportedNamespace = $false
    foreach ($prefix in $supportedPrefixes) {
        if ($CommandId.StartsWith($prefix, [StringComparison]::Ordinal)) {
            $isSupportedNamespace = $true
            break
        }
    }

    if (-not $isSupportedNamespace) {
        return
    }

    Add-Check
    if (-not $script:knownCommands.Contains($CommandId)) {
        Add-Failure "$Context references an unsupported or unconfigured command ID: $CommandId"
    }
}

if (-not (Test-Path -LiteralPath $VaultPath -PathType Container)) {
    throw "VaultPath is not an existing directory: $VaultPath"
}

$vaultRoot = (Resolve-Path -LiteralPath $VaultPath).Path
$obsidianRoot = Join-Path $vaultRoot '.obsidian'

Add-Check
if (-not (Test-Path -LiteralPath $obsidianRoot -PathType Container)) {
    Add-Failure 'The disposable vault has no .obsidian directory.'
}

foreach ($root in $RequiredRoots) {
    Assert-VaultDirectory -RelativePath $root -Context "Required root '$root'"
}

$knownCommands = New-Object 'System.Collections.Generic.HashSet[string]' -ArgumentList ([StringComparer]::Ordinal)
$quickAddChoiceIds = New-Object 'System.Collections.Generic.HashSet[string]' -ArgumentList ([StringComparer]::Ordinal)
$quickAddMacroIds = New-Object 'System.Collections.Generic.HashSet[string]' -ArgumentList ([StringComparer]::Ordinal)
$quickAddCommandIds = @()

$journalsPath = Join-Path $obsidianRoot 'plugins/journals/data.json'
$journals = Read-JsonFile -Path $journalsPath -Label 'Journals configuration'
$configuredDailyJournalFound = $false

if ($null -ne $journals -and (Test-ObjectProperty -Object $journals -Name 'journals')) {
    foreach ($journalProperty in $journals.journals.PSObject.Properties) {
        $journalName = [string]$journalProperty.Name
        $journal = $journalProperty.Value
        $configuredJournalName = Get-StringProperty -Object $journal -Name 'name'
        if (-not [string]::IsNullOrWhiteSpace($configuredJournalName)) {
            $journalName = $configuredJournalName
        }

        # Journals 1.x calendar schema.
        if ((Test-ObjectProperty -Object $journal -Name 'type') -and
            (Get-StringProperty -Object $journal -Name 'type') -eq 'calendar') {
            foreach ($sectionName in @('day', 'week', 'month', 'quarter', 'year')) {
                if (-not (Test-ObjectProperty -Object $journal -Name $sectionName)) {
                    continue
                }

                $section = $journal.$sectionName
                if (-not (Test-ObjectProperty -Object $section -Name 'enabled') -or
                    -not [bool]$section.enabled) {
                    continue
                }

                $sectionFolder = Get-StringProperty -Object $section -Name 'folder'
                $sectionTemplate = Get-StringProperty -Object $section -Name 'template'
                $sectionDateFormat = Get-StringProperty -Object $section -Name 'dateFormat'

                Assert-VaultDirectory -RelativePath $sectionFolder -Context "Journals $sectionName folder"
                Assert-VaultFile -RelativePath $sectionTemplate -Context "Journals $sectionName template"

                Add-Check
                if ([string]::IsNullOrWhiteSpace($sectionDateFormat)) {
                    Add-Failure "Journals $sectionName dateFormat is empty."
                }

                foreach ($direction in @('', 'next-', 'prev-')) {
                    $null = $knownCommands.Add("journals:journal:calendar:open-$direction$sectionName")
                }

                if ($sectionName -eq 'day') {
                    $configuredDailyJournalFound = $true
                    if (-not [string]::IsNullOrWhiteSpace($ExpectedDailyDateFormat)) {
                        Add-Check
                        if ($sectionDateFormat -ne $ExpectedDailyDateFormat) {
                            Add-Failure 'Journals day dateFormat does not match the explicitly required daily format.'
                        }
                    }
                }
            }
            continue
        }

        # Journals 2.x schema version 3. Each journal has one write type and a
        # list of user-configured commands whose IDs are derived from names.
        if ((Test-ObjectProperty -Object $journal -Name 'write') -and
            (Test-ObjectProperty -Object $journal.write -Name 'type')) {
            $writeType = Get-StringProperty -Object $journal.write -Name 'type'
            if (@('day', 'week', 'month', 'quarter', 'year') -notcontains $writeType) {
                continue
            }

            $journalLabel = "Journals '$journalName'"
            $sectionFolder = Get-StringProperty -Object $journal -Name 'folder'
            $sectionDateFormat = Get-StringProperty -Object $journal -Name 'dateFormat'

            Assert-VaultDirectory -RelativePath $sectionFolder -Context "$journalLabel folder"

            Add-Check
            if (-not (Test-ObjectProperty -Object $journal -Name 'templates') -or
                @($journal.templates).Count -eq 0) {
                Add-Failure "$journalLabel templates are empty."
            }
            else {
                foreach ($templatePath in @($journal.templates)) {
                    Assert-VaultFile -RelativePath ([string]$templatePath) -Context "$journalLabel template"
                }
            }

            Add-Check
            if ([string]::IsNullOrWhiteSpace($sectionDateFormat)) {
                Add-Failure "$journalLabel dateFormat is empty."
            }

            if (Test-ObjectProperty -Object $journal -Name 'commands') {
                foreach ($command in @($journal.commands)) {
                    $commandName = Get-StringProperty -Object $command -Name 'name'
                    if (-not [string]::IsNullOrWhiteSpace($commandName)) {
                        Add-CurrentJournalsCommand -JournalName $journalName -CommandName $commandName
                    }
                }
            }

            if ($writeType -eq 'day') {
                $configuredDailyJournalFound = $true
                if (-not [string]::IsNullOrWhiteSpace($ExpectedDailyDateFormat)) {
                    Add-Check
                    if ($sectionDateFormat -ne $ExpectedDailyDateFormat) {
                        Add-Failure 'Journals day dateFormat does not match the explicitly required daily format.'
                    }
                }
            }
        }
    }

    if (Test-ObjectProperty -Object $journals -Name 'commands') {
        foreach ($command in @($journals.commands)) {
            $commandName = Get-StringProperty -Object $command -Name 'name'
            $commandSlug = Get-JournalsCommandSlug -Value $commandName
            if (-not [string]::IsNullOrWhiteSpace($commandSlug)) {
                $null = $knownCommands.Add("journals::$commandSlug")
            }
        }
    }
}
else {
    Add-Failure 'Journals configuration has no journals object.'
}

Add-Check
if (-not $configuredDailyJournalFound) {
    Add-Failure 'No configured daily journal was found in Journals configuration.'
}

$templaterPath = Join-Path $obsidianRoot 'plugins/templater-obsidian/data.json'
$templater = Read-JsonFile -Path $templaterPath -Label 'Templater configuration'
if ($null -ne $templater) {
    if (Test-ObjectProperty -Object $templater -Name 'templates_folder') {
        Assert-VaultDirectory -RelativePath (Get-StringProperty -Object $templater -Name 'templates_folder') -Context 'Templater templates folder'
    }
    else {
        Add-Failure 'Templater templates_folder is missing.'
    }

    Add-Check
    if ((Test-ObjectProperty -Object $templater -Name 'enable_system_commands') -and
        [bool]$templater.enable_system_commands) {
        Add-Failure 'Templater system commands are enabled.'
    }

    if (Test-ObjectProperty -Object $templater -Name 'folder_templates') {
        foreach ($pair in @($templater.folder_templates)) {
            Assert-VaultDirectory -RelativePath (Get-StringProperty -Object $pair -Name 'folder') -Context 'Templater folder-template folder'
            Assert-VaultFile -RelativePath (Get-StringProperty -Object $pair -Name 'template') -Context 'Templater folder-template template'
        }
    }

    if (Test-ObjectProperty -Object $templater -Name 'enabled_templates_hotkeys') {
        foreach ($templatePath in @($templater.enabled_templates_hotkeys)) {
            Assert-VaultFile -RelativePath ([string]$templatePath) -Context 'Templater hotkey template'
            $null = $knownCommands.Add("templater-obsidian:$templatePath")
        }
    }
}

$quickAddPath = Join-Path $obsidianRoot 'plugins/quickadd/data.json'
$quickAdd = Read-JsonFile -Path $quickAddPath -Label 'QuickAdd configuration'
if ($null -ne $quickAdd) {
    if (Test-ObjectProperty -Object $quickAdd -Name 'macros') {
        foreach ($macro in @($quickAdd.macros)) {
            if ((Test-ObjectProperty -Object $macro -Name 'id') -and
                -not [string]::IsNullOrWhiteSpace([string]$macro.id)) {
                $null = $quickAddMacroIds.Add([string]$macro.id)
            }
        }
    }

    function Visit-QuickAddChoice {
        param([Parameter(Mandatory = $true)]$Choice)

        $choiceName = '<unnamed>'
        if (Test-ObjectProperty -Object $Choice -Name 'name') {
            $choiceName = [string]$Choice.name
        }

        if ((Test-ObjectProperty -Object $Choice -Name 'id') -and
            -not [string]::IsNullOrWhiteSpace([string]$Choice.id)) {
            $choiceId = [string]$Choice.id
            $null = $quickAddChoiceIds.Add($choiceId)
            if ((Test-ObjectProperty -Object $Choice -Name 'command') -and
                [bool]$Choice.command) {
                $null = $knownCommands.Add("quickadd:choice:$choiceId")
            }
        }

        if ((Test-ObjectProperty -Object $Choice -Name 'templatePath') -and
            -not [string]::IsNullOrWhiteSpace([string]$Choice.templatePath)) {
            Assert-VaultFile -RelativePath ([string]$Choice.templatePath) -Context "QuickAdd '$choiceName' template"
        }

        if (Test-ObjectProperty -Object $Choice -Name 'folder') {
            $folder = $Choice.folder
            $usesActiveFolder = (Test-ObjectProperty -Object $folder -Name 'createInSameFolderAsActiveFile') -and
                [bool]$folder.createInSameFolderAsActiveFile
            if ((Test-ObjectProperty -Object $folder -Name 'enabled') -and
                [bool]$folder.enabled -and
                -not $usesActiveFolder -and
                (Test-ObjectProperty -Object $folder -Name 'folders')) {
                foreach ($folderPath in @($folder.folders)) {
                    Assert-VaultDirectory -RelativePath ([string]$folderPath) -Context "QuickAdd '$choiceName' destination"
                }
            }
        }

        if ((Test-ObjectProperty -Object $Choice -Name 'captureTo') -and
            -not [string]::IsNullOrWhiteSpace([string]$Choice.captureTo)) {
            Assert-VaultDirectory -RelativePath ([string]$Choice.captureTo) -Context "QuickAdd '$choiceName' capture destination"
        }

        if (Test-ObjectProperty -Object $Choice -Name 'createFileIfItDoesntExist') {
            $create = $Choice.createFileIfItDoesntExist
            if ((Test-ObjectProperty -Object $create -Name 'enabled') -and
                [bool]$create.enabled -and
                (Test-ObjectProperty -Object $create -Name 'createWithTemplate') -and
                [bool]$create.createWithTemplate) {
                Assert-VaultFile -RelativePath (Get-StringProperty -Object $create -Name 'template') -Context "QuickAdd '$choiceName' create-file template"
            }
        }

        if ((Test-ObjectProperty -Object $Choice -Name 'macroId') -and
            -not [string]::IsNullOrWhiteSpace([string]$Choice.macroId)) {
            Add-Check
            if (-not $quickAddMacroIds.Contains([string]$Choice.macroId)) {
                Add-Failure "QuickAdd '$choiceName' references a missing macro."
            }
        }

        if (Test-ObjectProperty -Object $Choice -Name 'choices') {
            foreach ($child in @($Choice.choices)) {
                Visit-QuickAddChoice -Choice $child
            }
        }
    }

    if (Test-ObjectProperty -Object $quickAdd -Name 'choices') {
        foreach ($choice in @($quickAdd.choices)) {
            Visit-QuickAddChoice -Choice $choice
        }
    }

    $quickAddCommandIds = @(Get-JsonCommandIds -Value $quickAdd)
}

$hotkeysPath = Join-Path $obsidianRoot 'plugins/obsidian-hotkeys-for-specific-files/data.json'
$specificFiles = Read-JsonFile -Path $hotkeysPath -Label 'Specific-files hotkey configuration'
if ($null -ne $specificFiles -and (Test-ObjectProperty -Object $specificFiles -Name 'files')) {
    foreach ($entry in @($specificFiles.files)) {
        if (-not (Test-ObjectProperty -Object $entry -Name 'file')) {
            continue
        }

        $filePath = Get-StringProperty -Object $entry -Name 'file'
        Assert-VaultFile -RelativePath $filePath -Context 'Specific-files hotkey target'
        $null = $knownCommands.Add("obsidian-hotkeys-for-specific-files:$filePath")
        $null = $knownCommands.Add("obsidian-hotkeys-for-specific-files:$filePath-new-tab")
    }
}

foreach ($commandId in $quickAddCommandIds) {
    Test-SupportedCommandReference -CommandId $commandId -Context 'QuickAdd macro'
}

$hotkeysConfigPath = Join-Path $obsidianRoot 'hotkeys.json'
if (Test-Path -LiteralPath $hotkeysConfigPath -PathType Leaf) {
    $hotkeysConfig = Read-JsonFile -Path $hotkeysConfigPath -Label 'Obsidian hotkey configuration'
    if ($null -ne $hotkeysConfig) {
        foreach ($hotkeyProperty in $hotkeysConfig.PSObject.Properties) {
            Test-SupportedCommandReference -CommandId ([string]$hotkeyProperty.Name) -Context 'Obsidian hotkey'
        }
    }
}

$homepageConfigPath = Join-Path $obsidianRoot 'plugins/homepage/data.json'
$homepageConfig = Read-JsonFile -Path $homepageConfigPath -Label 'Homepage configuration'
$homepageFiles = New-Object 'System.Collections.Generic.List[string]'
if ($null -ne $homepageConfig -and (Test-ObjectProperty -Object $homepageConfig -Name 'homepages')) {
    foreach ($homeProperty in $homepageConfig.homepages.PSObject.Properties) {
        $homepageEntry = $homeProperty.Value
        if ((Test-ObjectProperty -Object $homepageEntry -Name 'kind') -and
            (Get-StringProperty -Object $homepageEntry -Name 'kind') -eq 'File' -and
            (Test-ObjectProperty -Object $homepageEntry -Name 'value')) {
            $homeRelativePath = Get-StringProperty -Object $homepageEntry -Name 'value'
            if ([string]::IsNullOrWhiteSpace([IO.Path]::GetExtension($homeRelativePath))) {
                $homeRelativePath += '.md'
            }
            Assert-VaultFile -RelativePath $homeRelativePath -Context "Homepage '$($homeProperty.Name)' file"
            $homepageFiles.Add($homeRelativePath) | Out-Null
        }
    }
}

$mobileHomepageRelativePath = 'SYSTEM/MOBILE HUB/Mobile Homepage.md'
$mobileHomepagePath = Join-Path $vaultRoot ($mobileHomepageRelativePath.Replace('/', [IO.Path]::DirectorySeparatorChar))
if ((Test-Path -LiteralPath $mobileHomepagePath -PathType Leaf) -and
    -not $homepageFiles.Contains($mobileHomepageRelativePath)) {
    $homepageFiles.Add($mobileHomepageRelativePath) | Out-Null
}

$noteToolbarPath = Join-Path $obsidianRoot 'plugins/note-toolbar/data.json'
$noteToolbar = Read-JsonFile -Path $noteToolbarPath -Label 'Note Toolbar configuration'
if ($null -ne $noteToolbar) {
    foreach ($commandId in (Get-JsonCommandIds -Value $noteToolbar)) {
        Test-SupportedCommandReference -CommandId $commandId -Context 'Note Toolbar'
    }
}

foreach ($homeRelativePath in $homepageFiles) {
    $homePath = Resolve-SafeVaultPath -RelativePath $homeRelativePath -Context 'Homepage content'
    if ($null -eq $homePath -or -not (Test-Path -LiteralPath $homePath -PathType Leaf)) {
        continue
    }

    $homeContent = Get-Content -LiteralPath $homePath -Raw -Encoding UTF8
    foreach ($match in [regex]::Matches($homeContent, '(?m)^\s*(?:>\s*)*command:\s*(.+?)\s*$')) {
        Test-SupportedCommandReference -CommandId $match.Groups[1].Value.Trim() -Context "Homepage '$homeRelativePath'"
    }

    Add-Check
    if ($homeContent -match '(?m)^[ \t]*(?:>[ \t]*)*project:[ \t]*[^\r\n]+[ \t]+limit:[ \t]*\d+[ \t]*$') {
        Add-Failure "Homepage '$homeRelativePath' joins Todoist project and limit directives on one line."
    }
}

if (-not $SkipSafeEndState) {
    $communityPluginsPath = Join-Path $obsidianRoot 'community-plugins.json'
    $communityPlugins = Read-JsonFile -Path $communityPluginsPath -Label 'Enabled community plugin list'
    if ($null -ne $communityPlugins) {
        $enabledCommunityPlugins = @($communityPlugins)
        foreach ($pluginId in $RequiredDisabledCommunityPlugins) {
            Add-Check
            if ($enabledCommunityPlugins -contains $pluginId) {
                Add-Failure "Gated community plugin is still enabled: $pluginId"
            }
        }
    }

    $corePluginsPath = Join-Path $obsidianRoot 'core-plugins.json'
    $corePlugins = Read-JsonFile -Path $corePluginsPath -Label 'Core plugin configuration'
    if ($null -ne $corePlugins) {
        foreach ($pluginId in $RequiredDisabledCorePlugins) {
            Add-Check
            if ((Test-ObjectProperty -Object $corePlugins -Name $pluginId) -and
                [bool]$corePlugins.$pluginId) {
                Add-Failure "Gated core plugin is still enabled: $pluginId"
            }
        }
    }

    Add-Check
    if (Test-Path -LiteralPath $obsidianRoot -PathType Container) {
        $prohibitedFiles = Get-ChildItem -LiteralPath $obsidianRoot -File -Recurse -Force |
            Where-Object {
                $_.Name -eq '.env' -or
                $_.Name -like '.env.*' -or
                $_.Name -match '(?i)(token|credential|secret)'
            }

        foreach ($file in $prohibitedFiles) {
            $relativeName = $file.FullName.Substring($vaultRoot.Length).TrimStart(
                [IO.Path]::DirectorySeparatorChar,
                [IO.Path]::AltDirectorySeparatorChar
            )
            Add-Failure "Credential-bearing filename remains in the disposable vault: $relativeName"
        }
    }
}

if ($failures.Count -gt 0) {
    Write-Host "Dusk workflow configuration checks failed: $($failures.Count) failure(s) across $checks checks."
    foreach ($failure in $failures) {
        Write-Host "- $failure"
    }
    exit 1
}

Write-Host "Dusk workflow configuration checks passed: $checks checks."