# TOPdeskPS

## Description

PowerShell module to interact with TOPdesk through its REST API. This module can be used by your standard operator to perform day to day and it can also be used to automate various TOPdesk actions.

## Installing the module
TOPdeskPS is published to the PowerShell gallery and can be installed by running:
```powershell
  Install-Module -Name TOPdeskPS -Repository PSGallery -Scope CurrentUser
``` 

## Connecting to TOPdesk
```powershell
  Connect-TdService -url 'https://YourCompany.TOPdesk.net' -Register
```
Connects to your TOPdesk instance and registers the url in the config system so that next time you run Connect-TdService it will remember your TOPdesk Url.

## Get Incidents
```powershell
  Get-TdIncident
```

## Create Incidents
```powershell
  New-TdIncident
```

## Documentation
For the full web based documentation visit the [TOPdeskPS site](https://andrewpla.github.io/TOPdeskPS) 

## Release History

A detailed release history is contained in the [Change Log](CHANGELOG.md).

## License

TOPdeskPS is provided under the [MIT license](LICENSE.md).
