# Installation script (PowerShell, Windows OS)
#
# it creates symbolic links in the HOME directory pointing to local files
#

Write-Host "Crete symbolic links"
Write-Host "Environment variable 'HOME': " $env:HOME

$scriptpath = $MyInvocation.MyCommand.Path
$dir = Split-Path $scriptpath

If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    $arguments = "& '" + $myinvocation.mycommand.definition + "'"
    Start-Process powershell -Verb runAs -ArgumentList $arguments
    Break
}

Write-host "Source directory: $dir"

Function Make-SymbolLink {
    Param (
        [string]$source,
        [string]$target
    )
    Process {
        if (Test-Path $target -PathType leaf)
        {
            Write-Host "`nWARNING: File/Link already exists: " $target
            Write-Host "Exit without creating link!`n"
        } else
        {
            New-Item -ItemType SymbolicLink -Value $source -Path $target
        }
    }
}

Make-SymbolLink (Join-path $dir .gitconfig) (Join-path $env:HOME ".gitconfig")
Make-SymbolLink (Join-path $dir .gitmessage) (Join-path $env:HOME ".gitmessage")
Make-SymbolLink (Join-path $dir .gitignore_global) (Join-path $env:HOME ".gitignore_global")

Write-Host ""
pause
