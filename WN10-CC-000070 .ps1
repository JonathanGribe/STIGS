<#
.SYNOPSIS
    WN10-CC-000070 is a Windows 10 security setting that requires Virtualization-Based Security (VBS) to be enabled. 
    VBS provides additional protection for features like Credential Guard and code integrity, helping prevent unauthorized access and malware attacks.


.NOTES
    Author          : Jonathan Gribe
    LinkedIn        : https://www.linkedin.com/in/jonathan-g-691338185/details/experience/
    GitHub          : https://github.com/JonathanGribe
    Date Created    : 5-14-2025
    Last Modified   : 
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000070 

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(Stig_Implementation_WN10-CC-000070).ps1 
#>

# Run PowerShell as Administrator

# Enable Virtualization-Based Security
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" -Name "EnableVirtualizationBasedSecurity" -Value 1 -Type DWord

# Configure Platform Security Level
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" -Name "RequirePlatformSecurityFeatures" -Value 3 -Type DWord  # 1 for Secure Boot only, 3 for Secure Boot and DMA Protection

# Verify the settings
Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" 
