<#
.SYNOPSIS
   WN10-CC-000039 is a Windows 10 security setting that removes the "Run as different user" option from context menus. 
   This prevents users from running applications with different credentials, reducing the risk of credential theft in standard user sessions. 
   Disabling this feature helps protect privileged accounts from unauthorized access


.NOTES
    Author          : Jonathan Gribe
    LinkedIn        : https://www.linkedin.com/in/jonathan-g-691338185/
    GitHub          : https://github.com/jonathangribe
    Date Created    : 2024-09-09
    Last Modified   : 2024-09-09
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000039

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(Stig_Implementation_WN10-CC-000039).ps1 
#>



# Define the registry path and value



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
