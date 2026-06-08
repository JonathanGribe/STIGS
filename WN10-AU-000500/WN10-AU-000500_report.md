# STIG_Implementation_WN10-CC-000038

## STIG Audit Failure

![STIG Audit Failure](image001.png)

## STIG Information

![STIG Information](image002.png)

## Findings

When opening the registry path `SYSTEM\CurrentControlSet\Control\SecurityProviders\Wdigest`, the value name `UseLogonCredential` could not be located.

![Findings Screenshot](image003.png)

## Manual Fix

Configure the policy value for:

`Computer Configuration > Administrative Templates > MS Security Guide > "WDigest Authentication (disabling may require KB2871997)"`

Set the policy to:

`Disabled`

Applied fix as per the instructions above.

![Manual Fix Screenshot](image004.jpg)

## PowerShell Fix

```powershell
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
