
# Quick Start
These quick start guides are designed to get you up and running with TOPdeskPS.
- Connecting to TOPdeskPS for the first time
- Look at current incidents
- Get a list of all operators
- Use TOPdeskPS to automate the closure of incidents

## Documentation
- [Command Reference](https://andrewpla.github.io/TOPdeskPS/commands/TOPdeskPS.html)



### Assign Proper API Permissions

If you haven't used the TOPdesk API before you will need to get an account with permissions to access the API.

Create a separate permission group that only allows the use of the API. Enable permissions for "Use Application passwords" and "REST API"

Link the newly created permission group to users that should be able to use the API. The permissions/rights for the other modules can come from other permission groups.

### Installing TOPdeskPS

TOPdeskPS is hosted on the PowerShell Gallery and can be installed by running Install-Module.

```powershell
Install-Module TOPdeskPS -Repository PSGallery -Scope CurrentUser
```

### Contributing to TOPdeskPS

