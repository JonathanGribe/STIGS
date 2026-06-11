
# Stig: WN10-AU-000500

# Event Log Application MaxSize Remediation

## Evidence / Screenshots

> The original Word document includes several screenshots. Replace the placeholders below with uploaded image paths after adding the images to your GitHub repository.

![Screenshot 1](images/screenshot-1.png)

![Screenshot 2](images/screenshot-2.png)

![Screenshot 3](images/screenshot-3.png)

![Screenshot 4](images/screenshot-4.png)

![Screenshot 5](images/screenshot-5.png)

## Post Manual Remediation

![Screenshot 6](images/screenshot-6.png)

Deleted the manual fix.

Re-ran to make sure it failed again.

## PowerShell Fix

Implemented PowerShell fix:

```powershell
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
Write-Output "Registry key '$registryPath' has been updated with '$registryValue' = $registryData"
