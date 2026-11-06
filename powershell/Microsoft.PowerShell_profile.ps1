# Aliases
Set-Alias ll Get-ChildItem

function la {
	Get-ChildItem -Force
}

# Vi mode
Set-PSReadLineOption -EditMode Vi

# UTF-8
chcp 65001 > $null
$OutputEncoding = [System.Text.UTF8Encoding]::new($false)
[Console]::InputEncoding = [System.Text.UTF8Encoding]::new($false)
[Console]::OutputEncoding = [System.Text.UTF8Encoding]::new($false)

