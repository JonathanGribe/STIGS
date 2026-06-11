# STIG Implementation: WN10-CC-000039

## 1. Initial Scan Results

**Status:** Failed

> Note the failed STIG finding.

<img width="975" height="91" alt="image" src="https://github.com/user-attachments/assets/8f2c54e7-a743-4f76-98a0-5e68399bea30" />


---

## 2. Gathering Information

### STIG Information

**STIG:** WN10-CC-000039 - V3R1 - STIG-A-View  
**Reference:** https://stigaview.com/products/win10/v3r1/WN10-CC-000039/

### Info

```text
The **Run as different user** selection from context menus allows the use of credentials other than the currently logged-on user.

Using privileged credentials in a standard user session can expose those credentials to theft. 
Removing this option from context menus helps prevent this from occurring.
```

### Solution (from Stig-A-View)

**Configure the policy value for:**

```text
Configure the policy value for Computer Configuration >> Administrative Templates >> MS Security Guide >> "Remove "Run as Different User" from context menus" to "Enabled".

This policy setting requires the installation of the SecGuide custom templates included with the STIG package. "SecGuide.admx" and "SecGuide.adml" must be copied to the \Windows\PolicyDefinitions and \Windows\PolicyDefinitions\en-US directories respectively.

```

## 3.  **Manual Solution:**
Unable to locate MS Security Guide so needed to install the Security Compliance Toolkit
Once downloaded via the website:
Extract the folder in downloads:

<img width="975" height="668" alt="image" src="https://github.com/user-attachments/assets/2013f6c0-b002-4b0d-9af8-5170d64adb8c" />

Located the .admx and .adml files to place in C:\Windows\PolicyDefinitions and C:\Windows\PolicyDefinitions\en-US folders 

<img width="975" height="173" alt="image" src="https://github.com/user-attachments/assets/61b30890-430d-4538-9329-8dee5ef89896" />

After updating policy definitions the MS Security Guide and MSS (Legacy) folders showed up
<img width="975" height="696" alt="image" src="https://github.com/user-attachments/assets/c4c7bdc8-6c94-4a92-a1bd-04f796d27586" />

Then as per the instructions above: 

```text

Configure the policy value for Computer Configuration >> Administrative Templates >> MS Security Guide 
>> "Remove "Run as Different User" from context menus" to "Enabled".

```
<img width="975" height="644" alt="image" src="https://github.com/user-attachments/assets/f9c7d702-706c-46b5-9913-d0b846cabf1e" />

**Restart VM and Tenable Rescan**
Passed scan:
<img width="975" height="271" alt="image" src="https://github.com/user-attachments/assets/4178a38e-833b-4e55-9238-ca18608e2186" />

Then disable that setting and rescan to get a failed status

## **4. Remediate again with Powershell:**

```kql
# Define registry paths
$registryPaths = @(
    "HKLM:\SOFTWARE\Classes\batfile\shell\runasuser",
    "HKLM:\SOFTWARE\Classes\cmdfile\shell\runasuser",
    "HKLM:\SOFTWARE\Classes\exefile\shell\runasuser",
    "HKLM:\SOFTWARE\Classes\mscfile\shell\runasuser"
)

# Apply registry changes
foreach ($path in $registryPaths) {
    if (!(Test-Path $path)) {
        New-Item -Path $path -Force
    }
    Set-ItemProperty -Path $path -Name "SuppressionPolicy" -Type DWord -Value 4096
}

Write-Output "STIG WN10-CC-000039 applied successfully." 
```

<img width="975" height="413" alt="image" src="https://github.com/user-attachments/assets/7ed296bb-39f4-4761-8562-b1d3915142d0" />

**Rerun STIG scan:Passed after script was run**
<img width="975" height="384" alt="image" src="https://github.com/user-attachments/assets/3468132a-c02c-462f-9c72-8d862a50107e" />



