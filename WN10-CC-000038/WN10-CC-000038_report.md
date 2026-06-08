<img width="975" height="573" alt="image" src="https://github.com/user-attachments/assets/2168a767-18b6-49aa-867c-c3307b8f3c01" />

<img width="975" height="262" alt="image" src="https://github.com/user-attachments/assets/3685670d-e92b-495c-9375-e65bc2e39233" />

<img width="975" height="511" alt="image" src="https://github.com/user-attachments/assets/6aac044b-6434-4514-83a2-ed74ebe8a27d" />

<img width="975" height="506" alt="image" src="https://github.com/user-attachments/assets/eddddc4d-a058-47d3-8f4c-768566f2d04f" />

<img width="975" height="287" alt="image" src="https://github.com/user-attachments/assets/7a25338f-b8c8-49a2-8160-45808732d78f" />


<img width="975" height="528" alt="image" src="https://github.com/user-attachments/assets/9ff9686e-0eea-40c4-a15d-777f00022318" />

## Powershell Remediation

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
```
