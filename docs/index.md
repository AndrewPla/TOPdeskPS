TOPdeskPS is a PowerShell module to interact with the TOPdesk Rest Api.

# Quick Start

### Assign Proper API Permissions
If you haven't used the TOPdesk API before you will need to get an an account with permissions to access the API.

Create a separate permission group that only allows the use of the API. Enable permissions for "Use Application passwords" and "REST API"

Link the newly created permission group to users that should be able to use the API. The permissions/rights for the other modules can come from other permission groups.

### Installing TOPdeskPS
TOPdeskPS is hosted on the PowerShell Gallery and you can access it via.
```powershell
Install-Module TOPdeskPS -Repository PSGallery -Scope CurrentUser
```
