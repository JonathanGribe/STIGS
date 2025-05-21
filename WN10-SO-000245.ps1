<#
.SYNOPSIS
   STIG WN10-SO-000245 is a security setting for Windows 10 that ensures the built-in Administrator account runs in Admin Approval Mode. This helps prevent unauthorized changes by requiring approval for elevated actions. It’s a security measure to limit risks from unrestricted admin privileges


.NOTES
    Author          : Jonathan Gribe
    LinkedIn        : https://www.linkedin.com/in/jonathan-g-691338185/details/experience/
    GitHub          : https://github.com/jonathangribe
    Date Created    : 2025-17-5
    Last Modified   : 2025-17-5
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000245

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-WN10-SO-000245.).ps1 
#>

# Define registry path and value
$registryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
$valueName = "FilterAdministratorToken"
$desiredValue = 1

# Check current value
$currentValue = (Get-ItemProperty -Path $registryPath -Name $valueName -ErrorAction SilentlyContinue).$valueName

if ($currentValue -ne $desiredValue) {
    Write-Host "Non-compliant! Updating registry value..."
    Set-ItemProperty -Path $registryPath -Name $valueName -Value $desiredValue
    Write-Host "Compliance enforced: Admin Approval Mode enabled."
} else {
    Write-Host "System is already compliant."
}
