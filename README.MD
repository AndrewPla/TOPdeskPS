# TOPdeskPS

## Description

PowerShell module to interact with TOPdesk through its REST API.

## Preparing TOPdesk

In order to connect to TOPdesk you will need to have an account with the required permissions. Create a separate permission group that only allows the use of the API. Enable permissions for "REST API".

## Installing the module
TOPdeskPS is published to the PowerShell gallery and can be installed by running:
```powershell
  Install-Module -Name TOPdeskPS -Repository PSGallery -Scope CurrentUser
``` 

## Connecting to TOPdesk
```powershell
  Connect-TdService -url 'https://Company.TOPdesk.net' -Register
```
Prompts for your TOPdesk credentials.
Connects to your TOPdesk instance and registers the url. The next time you run Connect-TdService it will remember your TOPdesk Url.

## Get Incidents
```powershell
  Get-TdIncident -PageSize 30
```

## Create Incidents
```powershell
  New-TdIncident -Action 'initial action here' -BriefDescription 'Brief description here' -CallerEmail 'user@company.com'
```

## Create People
```powershell
  New-TdPerson -Surname 'Doe' -BranchId (Get-TdBranch -Name test).id -FirstName 'John'
```

## Documentation
For the full web based documentation visit the [TOPdeskPS site](https://andrewpla.github.io/TOPdeskPS) 

## Release History

A detailed release history is contained in the [Change Log](CHANGELOG.md).

## License

TOPdeskPS is provided under the [MIT license](LICENSE.md).
