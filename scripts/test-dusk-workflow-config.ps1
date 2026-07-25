#Requires -Version 5.1

[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$checker = Join-Path $PSScriptRoot 'check-dusk-workflow-config.ps1'
if (-not (Test-Path -LiteralPath $checker -PathType Leaf)) {
    throw "Dusk workflow checker is missing: $checker"
}

function Write-JsonFile {
    param(
        [Parameter(Mandatory = $true)][string]$Path,
        [Parameter(Mandatory = $true)][AllowEmptyCollection()][AllowNull()]$Value
    )

    $parent = Split-Path -Parent $Path
    New-Item -ItemType Directory -Path $parent -Force | Out-Null
    $json = ConvertTo-Json -InputObject $Value -Depth 20
    [IO.File]::WriteAllText($Path, $json + [Environment]::NewLine)
}

function Invoke-Checker {
    param(
        [Parameter(Mandatory = $true)][string]$VaultPath,
        [string]$ExpectedDailyDateFormat
    )

    $arguments = @('-NoProfile', '-File', $checker, '-VaultPath', $VaultPath)
    if (-not [string]::IsNullOrWhiteSpace($ExpectedDailyDateFormat)) {
        $arguments += @('-ExpectedDailyDateFormat', $ExpectedDailyDateFormat)
    }

    $previousPreference = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    try {
        $output = @(& powershell @arguments 2>&1)
        $exitCode = $LASTEXITCODE
    }
    finally {
        $ErrorActionPreference = $previousPreference
    }

    return [pscustomobject]@{
        ExitCode = $exitCode
        Output = ($output -join "`n")
    }
}

function Assert-Pass {
    param(
        [Parameter(Mandatory = $true)]$Result,
        [Parameter(Mandatory = $true)][string]$Label
    )

    if ($Result.ExitCode -ne 0) {
        throw "$Label failed unexpectedly:`n$($Result.Output)"
    }
}

function Assert-Fail {
    param(
        [Parameter(Mandatory = $true)]$Result,
        [Parameter(Mandatory = $true)][string]$ExpectedText,
        [Parameter(Mandatory = $true)][string]$Label
    )

    if ($Result.ExitCode -eq 0) {
        throw "$Label passed unexpectedly."
    }
    if ($Result.Output -notmatch [regex]::Escape($ExpectedText)) {
        throw "$Label did not report the expected failure '$ExpectedText':`n$($Result.Output)"
    }
}

function New-BaselineVault {
    param([Parameter(Mandatory = $true)][string]$Path)

    foreach ($folder in @(
        'DAILY/DAILY',
        'HUB',
        'PARA',
        'STICKY',
        'SYSTEM/TEMPLATE/FORMAT',
        'ZETA',
        '.obsidian/plugins/journals',
        '.obsidian/plugins/templater-obsidian',
        '.obsidian/plugins/quickadd',
        '.obsidian/plugins/obsidian-hotkeys-for-specific-files',
        '.obsidian/plugins/homepage',
        '.obsidian/plugins/note-toolbar'
    )) {
        New-Item -ItemType Directory -Path (Join-Path $Path $folder) -Force | Out-Null
    }

    [IO.File]::WriteAllText(
        (Join-Path $Path 'SYSTEM/TEMPLATE/FORMAT/Daily.md'),
        "# Daily`n"
    )
    [IO.File]::WriteAllText(
        (Join-Path $Path 'HUB/Homepage.md'),
        "# Home`n"
    )

    Write-JsonFile -Path (Join-Path $Path '.obsidian/plugins/journals/data.json') -Value ([ordered]@{
        journals = [ordered]@{
            primary = [ordered]@{
                type = 'calendar'
                day = [ordered]@{
                    enabled = $true
                    folder = 'DAILY/DAILY'
                    template = 'SYSTEM/TEMPLATE/FORMAT/Daily.md'
                    dateFormat = 'YYYY-MM-DD'
                }
            }
        }
    })

    Write-JsonFile -Path (Join-Path $Path '.obsidian/plugins/templater-obsidian/data.json') -Value ([ordered]@{
        templates_folder = 'SYSTEM/TEMPLATE/FORMAT'
        enable_system_commands = $false
        folder_templates = @()
        enabled_templates_hotkeys = @()
    })

    Write-JsonFile -Path (Join-Path $Path '.obsidian/plugins/quickadd/data.json') -Value ([ordered]@{
        macros = @()
        choices = @()
    })

    Write-JsonFile -Path (Join-Path $Path '.obsidian/plugins/obsidian-hotkeys-for-specific-files/data.json') -Value ([ordered]@{
        files = @()
    })

    Write-JsonFile -Path (Join-Path $Path '.obsidian/plugins/homepage/data.json') -Value ([ordered]@{
        homepages = [ordered]@{
            main = [ordered]@{
                kind = 'File'
                value = 'HUB/Homepage'
            }
        }
    })

    Write-JsonFile -Path (Join-Path $Path '.obsidian/plugins/note-toolbar/data.json') -Value ([ordered]@{})
    Write-JsonFile -Path (Join-Path $Path '.obsidian/community-plugins.json') -Value @()
    Write-JsonFile -Path (Join-Path $Path '.obsidian/core-plugins.json') -Value ([ordered]@{
        publish = $false
        sync = $false
    })
}

function Set-CurrentJournalsFixture {
    param([Parameter(Mandatory = $true)][string]$Path)

    Write-JsonFile -Path (Join-Path $Path '.obsidian/plugins/journals/data.json') -Value ([ordered]@{
        version = 3
        commands = @()
        journals = [ordered]@{
            'personal daily' = [ordered]@{
                name = 'personal daily'
                write = [ordered]@{
                    type = 'day'
                }
                nameTemplate = '{{date}}'
                dateFormat = 'YYYY-MM-DD'
                folder = 'DAILY/DAILY'
                templates = @('SYSTEM/TEMPLATE/FORMAT/Daily.md')
                commands = @(
                    [ordered]@{
                        name = "Open today's note"
                        type = 'same'
                        context = 'today'
                    }
                )
            }
        }
    })

    [IO.File]::WriteAllText(
        (Join-Path $Path 'HUB/Homepage.md'),
        "command: journals:personal-daily:open-today's-note`n"
    )
    New-Item -ItemType Directory -Path (Join-Path $Path 'SYSTEM/MOBILE HUB') -Force | Out-Null
    [IO.File]::WriteAllText(
        (Join-Path $Path 'SYSTEM/MOBILE HUB/Mobile Homepage.md'),
        "command: journals:personal-daily:open-today's-note`n"
    )
    Write-JsonFile -Path (Join-Path $Path '.obsidian/hotkeys.json') -Value ([ordered]@{
        "journals:personal-daily:open-today's-note" = @()
    })
}

$tempBase = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
$tempRoot = Join-Path $tempBase ("dusk-workflow-checker-test-" + [Guid]::NewGuid().ToString('N'))
$baseline = Join-Path $tempRoot 'baseline'

try {
    New-BaselineVault -Path $baseline

    Assert-Pass -Label 'Baseline without exact format' -Result (
        Invoke-Checker -VaultPath $baseline
    )
    Assert-Pass -Label 'Baseline with exact format' -Result (
        Invoke-Checker -VaultPath $baseline -ExpectedDailyDateFormat 'YYYY-MM-DD'
    )


    $currentBaseline = Join-Path $tempRoot 'current-schema-baseline'
    Copy-Item -LiteralPath $baseline -Destination $currentBaseline -Recurse
    Set-CurrentJournalsFixture -Path $currentBaseline
    Assert-Pass -Label 'Current Journals schema baseline' -Result (
        Invoke-Checker -VaultPath $currentBaseline
    )
    Assert-Pass -Label 'Current Journals schema with exact format' -Result (
        Invoke-Checker -VaultPath $currentBaseline -ExpectedDailyDateFormat 'YYYY-MM-DD'
    )

    $case = Join-Path $tempRoot 'current-format-mismatch'
    Copy-Item -LiteralPath $currentBaseline -Destination $case -Recurse
    Assert-Fail -Label 'Current schema explicit format mismatch' -ExpectedText 'Journals day dateFormat does not match the explicitly required daily format.' -Result (
        Invoke-Checker -VaultPath $case -ExpectedDailyDateFormat 'YYYY.MM.DD'
    )

    $case = Join-Path $tempRoot 'current-empty-format'
    Copy-Item -LiteralPath $currentBaseline -Destination $case -Recurse
    $journalsPath = Join-Path $case '.obsidian/plugins/journals/data.json'
    $journals = Get-Content -LiteralPath $journalsPath -Raw | ConvertFrom-Json
    $journals.journals.'personal daily'.dateFormat = ''
    Write-JsonFile -Path $journalsPath -Value $journals
    Assert-Fail -Label 'Current schema empty daily format' -ExpectedText "Journals 'personal daily' dateFormat is empty." -Result (
        Invoke-Checker -VaultPath $case
    )

    $case = Join-Path $tempRoot 'current-stale-legacy-command'
    Copy-Item -LiteralPath $currentBaseline -Destination $case -Recurse
    [IO.File]::WriteAllText(
        (Join-Path $case 'HUB/Homepage.md'),
        "command: journals:journal:calendar:open-day`n"
    )
    Assert-Fail -Label 'Current schema stale legacy command' -ExpectedText 'references an unsupported or unconfigured command ID: journals:journal:calendar:open-day' -Result (
        Invoke-Checker -VaultPath $case
    )

    $case = Join-Path $tempRoot 'current-stale-mobile-command'
    Copy-Item -LiteralPath $currentBaseline -Destination $case -Recurse
    [IO.File]::WriteAllText(
        (Join-Path $case 'SYSTEM/MOBILE HUB/Mobile Homepage.md'),
        "command: journals:journal:calendar:open-day`n"
    )
    Assert-Fail -Label 'Current schema stale mobile command' -ExpectedText "Homepage 'SYSTEM/MOBILE HUB/Mobile Homepage.md' references an unsupported or unconfigured command ID: journals:journal:calendar:open-day" -Result (
        Invoke-Checker -VaultPath $case
    )

    $case = Join-Path $tempRoot 'current-stale-hotkey-command'
    Copy-Item -LiteralPath $currentBaseline -Destination $case -Recurse
    Write-JsonFile -Path (Join-Path $case '.obsidian/hotkeys.json') -Value ([ordered]@{
        'journals:journal:calendar:open-day' = @()
    })
    Assert-Fail -Label 'Current schema stale hotkey command' -ExpectedText 'Obsidian hotkey references an unsupported or unconfigured command ID: journals:journal:calendar:open-day' -Result (
        Invoke-Checker -VaultPath $case
    )

    $case = Join-Path $tempRoot 'valid-templater-hotkey'
    Copy-Item -LiteralPath $currentBaseline -Destination $case -Recurse
    $templatePath = 'SYSTEM/TEMPLATE/FORMAT/Toggle.md'
    [IO.File]::WriteAllText((Join-Path $case $templatePath), "# Toggle`n")
    $templaterPath = Join-Path $case '.obsidian/plugins/templater-obsidian/data.json'
    $templater = Get-Content -LiteralPath $templaterPath -Raw | ConvertFrom-Json
    $templater.enabled_templates_hotkeys = @($templatePath)
    Write-JsonFile -Path $templaterPath -Value $templater
    Write-JsonFile -Path (Join-Path $case '.obsidian/hotkeys.json') -Value ([ordered]@{
        "templater-obsidian:$templatePath" = @()
    })
    Assert-Pass -Label 'Configured Templater hotkey command' -Result (
        Invoke-Checker -VaultPath $case
    )

    $case = Join-Path $tempRoot 'stale-templater-insert-hotkey'
    Copy-Item -LiteralPath $currentBaseline -Destination $case -Recurse
    $templatePath = 'SYSTEM/TEMPLATE/FORMAT/Toggle.md'
    [IO.File]::WriteAllText((Join-Path $case $templatePath), "# Toggle`n")
    $templaterPath = Join-Path $case '.obsidian/plugins/templater-obsidian/data.json'
    $templater = Get-Content -LiteralPath $templaterPath -Raw | ConvertFrom-Json
    $templater.enabled_templates_hotkeys = @($templatePath)
    Write-JsonFile -Path $templaterPath -Value $templater
    Write-JsonFile -Path (Join-Path $case '.obsidian/hotkeys.json') -Value ([ordered]@{
        "templater-obsidian:insert-$templatePath" = @()
    })
    Assert-Fail -Label 'Stale Templater insert-prefix hotkey' -ExpectedText "Obsidian hotkey references an unsupported or unconfigured command ID: templater-obsidian:insert-$templatePath" -Result (
        Invoke-Checker -VaultPath $case
    )

    $case = Join-Path $tempRoot 'valid-specific-file-hotkey'
    Copy-Item -LiteralPath $currentBaseline -Destination $case -Recurse
    $specificFilePath = 'HUB/Mail Box.md'
    [IO.File]::WriteAllText((Join-Path $case $specificFilePath), "# Mail Box`n")
    Write-JsonFile -Path (Join-Path $case '.obsidian/plugins/obsidian-hotkeys-for-specific-files/data.json') -Value ([ordered]@{
        files = @(
            [ordered]@{
                useMoment = $false
                file = $specificFilePath
            }
        )
    })
    Write-JsonFile -Path (Join-Path $case '.obsidian/hotkeys.json') -Value ([ordered]@{
        "obsidian-hotkeys-for-specific-files:$specificFilePath" = @()
        "obsidian-hotkeys-for-specific-files:$specificFilePath-new-tab" = @()
    })
    Assert-Pass -Label 'Configured specific-file hotkey commands' -Result (
        Invoke-Checker -VaultPath $case
    )

    $case = Join-Path $tempRoot 'stale-specific-file-hotkey'
    Copy-Item -LiteralPath $currentBaseline -Destination $case -Recurse
    $specificFilePath = 'HUB/Mail Box.md'
    [IO.File]::WriteAllText((Join-Path $case $specificFilePath), "# Mail Box`n")
    Write-JsonFile -Path (Join-Path $case '.obsidian/plugins/obsidian-hotkeys-for-specific-files/data.json') -Value ([ordered]@{
        files = @(
            [ordered]@{
                useMoment = $false
                file = $specificFilePath
            }
        )
    })
    Write-JsonFile -Path (Join-Path $case '.obsidian/hotkeys.json') -Value ([ordered]@{
        'obsidian-hotkeys-for-specific-files:HUB/Inbox.md' = @()
    })
    Assert-Fail -Label 'Stale specific-file hotkey command' -ExpectedText 'Obsidian hotkey references an unsupported or unconfigured command ID: obsidian-hotkeys-for-specific-files:HUB/Inbox.md' -Result (
        Invoke-Checker -VaultPath $case
    )

    $case = Join-Path $tempRoot 'stale-specific-file-new-tab-hotkey'
    Copy-Item -LiteralPath $currentBaseline -Destination $case -Recurse
    $specificFilePath = 'HUB/Mail Box.md'
    [IO.File]::WriteAllText((Join-Path $case $specificFilePath), "# Mail Box`n")
    Write-JsonFile -Path (Join-Path $case '.obsidian/plugins/obsidian-hotkeys-for-specific-files/data.json') -Value ([ordered]@{
        files = @(
            [ordered]@{
                useMoment = $false
                file = $specificFilePath
            }
        )
    })
    $staleNewTabCommand = 'obsidian-hotkeys-for-specific-files:SYSTEM/TEMPLATE/CODE/toggle_todo_revert.md-new-tab'
    $staleNewTabHotkeys = [ordered]@{}
    $staleNewTabHotkeys[$staleNewTabCommand] = @()
    Write-JsonFile -Path (Join-Path $case '.obsidian/hotkeys.json') -Value $staleNewTabHotkeys
    Assert-Fail -Label 'Stale specific-file new-tab hotkey command' -ExpectedText "Obsidian hotkey references an unsupported or unconfigured command ID: $staleNewTabCommand" -Result (
        Invoke-Checker -VaultPath $case
    )

    $case = Join-Path $tempRoot 'current-mobile-malformed-home'
    Copy-Item -LiteralPath $currentBaseline -Destination $case -Recurse
    [IO.File]::WriteAllText(
        (Join-Path $case 'SYSTEM/MOBILE HUB/Mobile Homepage.md'),
        "command: journals:personal-daily:open-today's-note`nproject: Inbox limit: 4`n"
    )
    Assert-Fail -Label 'Malformed Mobile Home Todoist syntax' -ExpectedText "Homepage 'SYSTEM/MOBILE HUB/Mobile Homepage.md' joins Todoist project and limit directives on one line." -Result (
        Invoke-Checker -VaultPath $case
    )

    $case = Join-Path $tempRoot 'current-valid-multiline-todoist'
    Copy-Item -LiteralPath $currentBaseline -Destination $case -Recurse
    [IO.File]::WriteAllText(
        (Join-Path $case 'SYSTEM/MOBILE HUB/Mobile Homepage.md'),
        "command: journals:personal-daily:open-today's-note`nproject: Inbox`nlimit: 4`n"
    )
    Assert-Pass -Label 'Valid multiline Mobile Home Todoist syntax' -Result (
        Invoke-Checker -VaultPath $case
    )

    $case = Join-Path $tempRoot 'format-mismatch'
    Copy-Item -LiteralPath $baseline -Destination $case -Recurse
    Assert-Fail -Label 'Explicit format mismatch' -ExpectedText 'Journals day dateFormat does not match the explicitly required daily format.' -Result (
        Invoke-Checker -VaultPath $case -ExpectedDailyDateFormat 'YYYY.MM.DD'
    )

    $case = Join-Path $tempRoot 'empty-format'
    Copy-Item -LiteralPath $baseline -Destination $case -Recurse
    $journalsPath = Join-Path $case '.obsidian/plugins/journals/data.json'
    $journals = Get-Content -LiteralPath $journalsPath -Raw | ConvertFrom-Json
    $journals.journals.primary.day.dateFormat = ''
    Write-JsonFile -Path $journalsPath -Value $journals
    Assert-Fail -Label 'Empty daily format' -ExpectedText 'Journals day dateFormat is empty.' -Result (
        Invoke-Checker -VaultPath $case
    )

    $case = Join-Path $tempRoot 'malformed-home'
    Copy-Item -LiteralPath $baseline -Destination $case -Recurse
    [IO.File]::WriteAllText(
        (Join-Path $case 'HUB/Homepage.md'),
        "project: Inbox limit: 4`n"
    )
    Assert-Fail -Label 'Malformed Home Todoist syntax' -ExpectedText 'joins Todoist project and limit directives on one line.' -Result (
        Invoke-Checker -VaultPath $case
    )

    foreach ($pluginId in @(
        'digitalgarden',
        'meld-encrypt',
        'obsidian42-brat',
        'obsidian-custom-frames',
        'share-note',
        'todoist-sync-plugin'
    )) {
        $case = Join-Path $tempRoot ("gated-plugin-" + $pluginId)
        Copy-Item -LiteralPath $baseline -Destination $case -Recurse
        Write-JsonFile -Path (Join-Path $case '.obsidian/community-plugins.json') -Value @($pluginId)
        Assert-Fail -Label "Enabled gated plugin: $pluginId" -ExpectedText "Gated community plugin is still enabled: $pluginId" -Result (
            Invoke-Checker -VaultPath $case
        )
    }

    $case = Join-Path $tempRoot 'missing-root'
    Copy-Item -LiteralPath $baseline -Destination $case -Recurse
    Remove-Item -LiteralPath (Join-Path $case 'STICKY') -Recurse
    Assert-Fail -Label 'Missing required root' -ExpectedText "Required root 'STICKY' does not resolve to an existing vault directory." -Result (
        Invoke-Checker -VaultPath $case
    )

    $case = Join-Path $tempRoot 'unknown-command'
    Copy-Item -LiteralPath $baseline -Destination $case -Recurse
    [IO.File]::WriteAllText(
        (Join-Path $case 'HUB/Homepage.md'),
        "command: quickadd:choice:missing`n"
    )
    Assert-Fail -Label 'Unknown supported command' -ExpectedText 'references an unsupported or unconfigured command ID: quickadd:choice:missing' -Result (
        Invoke-Checker -VaultPath $case
    )

    $case = Join-Path $tempRoot 'credential-filename'
    Copy-Item -LiteralPath $baseline -Destination $case -Recurse
    [IO.File]::WriteAllText(
        (Join-Path $case '.obsidian/todoist-token'),
        "fixture`n"
    )
    Assert-Fail -Label 'Credential-bearing filename' -ExpectedText 'Credential-bearing filename remains in the disposable vault: .obsidian' -Result (
        Invoke-Checker -VaultPath $case
    )

    Write-Host 'Dusk workflow checker tests passed: 28 cases.'
}
finally {
    $resolved = [IO.Path]::GetFullPath($tempRoot)
    if ($resolved.StartsWith($tempBase, [StringComparison]::OrdinalIgnoreCase) -and
        (Test-Path -LiteralPath $resolved)) {
        Remove-Item -LiteralPath $resolved -Recurse -Force
    }
}
