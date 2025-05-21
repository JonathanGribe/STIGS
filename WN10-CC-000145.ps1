<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Jonathan Gribe
    LinkedIn        : https://www.linkedin.com/in/jonathan-g-691338185/details/experience/
    GitHub          : https://github.com/jonathangribe
    Date Created    : 05-13-2025
    Last Modified   : 
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000145

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(Stig_Implementation_WN10-CC-000145).ps1 
#>
<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Jonathan Gribe
    LinkedIn        : https://www.linkedin.com/in/jonathan-g-691338185/details/experience/
    GitHub          : https://github.com/jonathangribe
    Date Created    : 
    Last Modified   : 
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000145

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(Stig_Implementation_WN10-CC-000145).ps1 
#>

# Set the registry value to require a password when waking from sleep on battery
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51"
$registryName = "DCSettingIndex"
$registryValue = 1

# Check if the registry path exists
if (!(Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set the registry value
Set-ItemProperty -Path $registryPath -Name $registryName -Value $registryValue -Type DWord

Write-Output "STIG requirement WN10-CC-000145 has been configured successfully."
