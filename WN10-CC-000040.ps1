.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Jonathan Gribe
    LinkedIn        : https://www.linkedin.com/in/jonathan-g-691338185/
    GitHub          : https://github.com/JonathanGribe
    Date Created    : 05-10/2025
    Last Modified   : 
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : 

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(Stig_Implementation_WN10-CC-000040).ps1 
#>



# Define the registry path and value
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"
$registryValue = "MaxSize"
$registryData = 0x8000

# Check if the registry path exists, and create it if necessary
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set the registry value
Set-ItemProperty -Path $registryPath -Name $registryValue -Value $registryData -Type DWord

# Confirm the change
Write-Output "Registry key '$registryPath' has been up

# Define the registry path and value
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\LanmanWorkstation"
$registryName = "AllowInsecureGuestAuth"
$registryValue = 0

# Check if the registry path exists, create if necessary
if (!(Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set the registry value
Set-ItemProperty -Path $registryPath -Name $registryName -Value $registryValue

Write-Output "Insecure guest logons have been disabled."
