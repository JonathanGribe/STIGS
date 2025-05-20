.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Jonathan Gribe
    LinkedIn        : https://www.linkedin.com/in/jonathan-g-691338185/
    GitHub          : https://github.com/JonathanGribe
    Date Created    : 2025-17-05
    Last Modified   : 2024-17-05
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000038

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(Stig_Implementation_WN10-CC-000038).ps1 
#>

<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Jonathan Gribe
    LinkedIn        : https://www.linkedin.com/in/jonathan-g-691338185/
    GitHub          : https://github.com/JonathanGribe
    Date Created    : 2025-17-05
    Last Modified   : 2024-17-05
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000038

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\Stig_.ps1 
#>

# Define the registry path, value name, and desired value
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\Wdigest"
$valueName = "UseLogonCredential"
$desiredValue = 0

# Check if the registry key exists; if not, create it.
if (-not (Test-Path $regPath)) {
    New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders" -Name "Wdigest" -Force | Out-Null
    Write-Output "Created registry key: $regPath"
}

# Set the UseLogonCredential registry value to 0 (as a REG_DWORD)
Set-ItemProperty -Path $regPath -Name $valueName -Value $desiredValue -Type DWord
Write-Output "Set '$valueName' to $desiredValue at $regPath"
