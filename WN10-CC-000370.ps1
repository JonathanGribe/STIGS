<#
.SYNOPSIS
    WN10-CC-000370 is a Windows 10 security setting that disables convenience PIN sign-in for domain users. 
    This prevents users from logging in with a simple PIN instead of a password, reducing the risk of credential theft. 
    The policy ensures stronger authentication methods are used for security


.NOTES
    Author          : Jonathan Gribe
    LinkedIn        : https://www.linkedin.com/in/jonathan-g-691338185/details/experience/
    GitHub          : https://github.com/jonathangribe
    Date Created    : 2025-16-5
    Last Modified   : 2025-16-5
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000370

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(Stig_Implementation_WN10-CC-000370).ps1 
#>


# Define the registry path, value name, and desired value
$regPath = 'HKLM:\Software\Policies\Microsoft\Windows\System'
$valueName = 'AllowDomainPINLogon'
$desiredValue = 0

# Check if the registry path exists; if not, create it.
if (-not (Test-Path $regPath)) {
    New-Item -Path 'HKLM:\Software\Policies\Microsoft\Windows' -Name 'System' -Force | Out-Null
    Write-Output "Created registry path: $regPath"
}

# Set the AllowDomainPINLogon registry value to 0 (REG_DWORD)
Set-ItemProperty -Path $regPath -Name $valueName -Value $desiredValue -Type DWord
Write-Output "Set $valueName to $desiredValue"
