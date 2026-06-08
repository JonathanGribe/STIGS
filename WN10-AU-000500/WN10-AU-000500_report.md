# STIG_Implementation_WN10-CC-000038

## STIG Audit Failure

<img width="975" height="358" alt="image" src="https://github.com/user-attachments/assets/3469e1b6-bbfd-46e3-9715-83feb6c918da" />


## STIG Information

<img width="794" height="699" alt="image" src="https://github.com/user-attachments/assets/3dba2d12-2b25-45df-ac32-239f1df991fe" />


## Findings

When opening the registry path `SYSTEM\CurrentControlSet\Control\SecurityProviders\Wdigest`, the value name `UseLogonCredential` could not be located.

<img width="975" height="610" alt="image" src="https://github.com/user-attachments/assets/c3f98ee1-810c-4b9a-b9e9-007ae21eed29" />


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
