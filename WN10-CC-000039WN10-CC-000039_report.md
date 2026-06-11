# STIG Implementation: WN10-CC-000039

## Initial Scan Results

**Status:** Failed

> Note the failed STIG finding.

<img width="975" height="91" alt="image" src="https://github.com/user-attachments/assets/8f2c54e7-a743-4f76-98a0-5e68399bea30" />


---

## Gathering Information

### STIG Information

**STIG:** WN10-CC-000039 - V3R1 - STIG-A-View  
**Reference:** https://stigaview.com/products/win10/v3r1/WN10-CC-000039/

### Info

The **Run as different user** selection from context menus allows the use of credentials other than the currently logged-on user.

Using privileged credentials in a standard user session can expose those credentials to theft. Removing this option from context menus helps prevent this from occurring.

### Solution

Configure the policy value for:

```text
Computer Configuration >> Administrative Templates >> MS Security Guide >> "Remove "Run as Different User" from context menus"
