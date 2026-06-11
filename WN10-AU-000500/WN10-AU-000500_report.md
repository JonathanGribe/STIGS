
# STIG Implementation:  WN10-AU-000500

## 1. Initial Scan Results

**Status:** Failed

> Note the failed STIG finding.

<img width="975" height="149" alt="image" src="https://github.com/user-attachments/assets/526b2d88-2cfc-4713-826a-d654bf88efba" />



---

## 2. Gathering Information

### STIG Information

**STIG:** WN10-AU-000500
**Reference:** https://preview.stigaview.com/products/win10/v3r2/WN10-AU-000500/

### Info

```text
Inadequate log size will cause the log to fill up quickly. 
This may prevent audit events from being recorded properly and 
require frequent attention by administrative personnel.
```

### Solution (from Stig-A-View)

**Configure the policy value for:**

```text

If the system is configured to send audit records directly to an audit server, this is NA. This must be documented with the ISSO.

Configure the policy value for Computer Configuration >> Administrative Templates >> Windows Components >> Event Log Service >> Application >> "Specify the maximum log file size (KB)" to "Enabled" with a "Maximum Log Size (KB)" of "32768" or greater.

```

**Location/Check:**

```text
If the system is configured to send audit records directly to an audit server, this is NA. This must be documented with the ISSO.

If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Policies\Microsoft\Windows\EventLog\Application\

Value Name: MaxSize

Value Type: REG_DWORD
Value: 0x00008000 (32768) (or greater)
```

## 3.  **Manual Solution:**

***Navigated to the location as indicated in the Stig information above**
***Performed the operations required to remediate the stig**

<img width="975" height="511" alt="image" src="https://github.com/user-attachments/assets/c9ad8e4d-16ab-4fe5-802b-f354b6339e62" />

***Re-ran the Tenable scan.  Stig was resolved.***
<img width="975" height="287" alt="image" src="https://github.com/user-attachments/assets/a2d1fbd0-10e5-45d6-8a4c-b352a038f612" />



## **4. Remediate again with Powershell:**

```kql
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

<img width="975" height="528" alt="image" src="https://github.com/user-attachments/assets/908e9026-10ff-4ea6-b3c5-20d9cfdab036" />



