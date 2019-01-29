---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Connect-TdService

## SYNOPSIS
Prepares your session for TOPdeskPS

## SYNTAX

```
Connect-TdService [-Credential] <PSCredential> [[-UserType] <Object>] [-PassThru] [[-Url] <String>] [-Register]
 [-ApplicationPassword] [-EnableException] [<CommonParameters>]
```

## DESCRIPTION
This command either generates a login token if you provide TOPdesk credentials or this will generate the headers if you are using an application password (use -ApplicationPassword)

## EXAMPLES

### EXAMPLE 1
```
Connect-TdService -Url 'https://company.topdesk.net' -Credential (Get-Credential)
```

Prompts you for your TOPdesk credentials and then connects to TOPdesk.

### EXAMPLE 2
```
Connect-TdService -Credential $Cred -Url 'https://company.topdesk.net:90' -Register -ApplicationPassword
```

Generates a header that is specific to Application Passwords.
The Url will be registered so you don't need to enter it the next time you run connect-tdservice.
We will be using port 90.

## PARAMETERS

### -Credential
Credentials used to access TOPdesk.

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UserType
Specify whether you want to login as a person or an operator.
Default value: operator

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: Operator
Accept pipeline input: False
Accept wildcard characters: False
```

### -PassThru
Passes the login token through to the console.
Can be useful for troubleshooting or if you want to generate a login token to be consumed by a different application.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Url
This is the Url of your TOPdesk instance.
You can specify a custom port.
Example: 'https://Company.TOPdesk.net' , 'http://10.1.2.3:90'

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: (
           Get-TdUrl)
Accept pipeline input: False
Accept wildcard characters: False
```

### -Register
Saves your TOPdesk url so you don't need to manually specify it each time.
For more information see about_TOPdeskPS_Registration

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ApplicationPassword
Specify whether you are supplying an application password credential rather than a TOPdesk credential.
The credential still needs to be provided to the Credential parameter.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -EnableException
Specify whether you want this command to throw an exception if it encounters an error.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.String
## NOTES

## RELATED LINKS
