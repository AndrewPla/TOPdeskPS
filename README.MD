# TOPdeskPS

[![Build status](https://dev.azure.com/AndrewPlaTech/TOPdeskPS/_apis/build/status/Build)](https://dev.azure.com/AndrewPlaTech/TOPdeskPS/_build/latest?definitionId=1)

## Description

PowerShell module to interact with TOPdesk through its REST API. This module can be used to ease daily administration of TOPdesk as well as provide awesome automation abilities.

## Preparing TOPdesk

In order to connect to TOPdesk you will need to have an account with the required permissions. Create a separate permission group that only allows the use of the API. Enable permissions for "REST API". 

See https://developers.topdesk.com/tutorial.html#show-collapse-config-topdesk for instructions on how to grant API permissions and how to generate an application password if you prefer. This module supports using an application password and using standard topdesk login creds.

## Installing the module
TOPdeskPS is published to the PowerShell gallery and can be installed by running:
```powershell
  Install-Module -Name TOPdeskPS -Repository PSGallery -Scope CurrentUser
```

## Connecting to TOPdesk

### Using TOPdesk login Credentials (not SSO)
```powershell
  Connect-TdService -url 'https://Company.TOPdesk.net' -Register
```
Prompts for your TOPdesk credentials.
Connects to your TOPdesk instance and registers the url. The next time you run Connect-TdService it will remember your TOPdesk Url.

### Using an application password

Use an application password to connect rather than your TOPdesk login credentials. The username should be the topdesk login name of the user who created the application password.

```powershell
  Connect-TdService -url 'https://company.topdesk.net' -ApplicationPassword
```

## Get Incidents

Return incidents
```powershell
  Get-TdIncident -ResultSize 50
```

## Create Incidents
```powershell
$IncidentParams = @{
  Action = 'Initial Action'
  BriefDescription = 'brief description'
  CallerEmail = 'Test@Test.com'
}
New-TdIncident @IncidentParams
```

## Update Incidents
```powershell
$incidentParams = @{
  Number = 'I1811-123'
  Action = 'Updated Action'
  Operator = (Get-TdOperator 'username@company.net').id
  Category = 'TechSupport'
  Subcategory = 'PowerShell'
}
Set-TdIncident @incidentParams
```

## Create Persons
```powershell
$personParams = @{
  Surname = 'Doe'
  BranchId = (Get-TdBranch -Name HQ).id
  NetworkLoginName = 'User@company.com'
  Gender = 'FEMALE'
  Email = 'User@company.com'
}
  New-TdPerson @personParams
```

## Send Notifications

Use the task notifications api to send alerts to your operators.

```powershell
Send-TdTaskNotification -Title 'TOPdesk notification from PS!' -Body "You've got the power" -OperatorId (Get-TdOperator 'First.Last').id
```
![](./images/TOPdesk-Notif.png)

## Documentation
For the full web based documentation visit the [TOPdeskPS site](https://andrewpla.github.io/TOPdeskPS)

## Release History

A detailed release history is contained in the [Change Log](CHANGELOG.md).

## License

TOPdeskPS is provided under the [MIT license](LICENSE.md).
