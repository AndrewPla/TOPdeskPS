---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Connect-TdService

## SYNOPSIS
Connects to the TOPdesk Service

## SYNTAX

```
Connect-TdService [-Credential] <PSCredential> [[-UserType] <Object>] [-PassThru] [[-Url] <String>] [-Register]
 [-EnableException] [<CommonParameters>]
```

## DESCRIPTION
Establishes a connection to TOPdesk.

## EXAMPLES

### EXAMPLE 1
```
Connect-TdService
```

Prompts you for your TOPdesk credentials and then connects to TOPdesk.

### EXAMPLE 2
```
Connect-TdService -Credential $Cred
```

Connects to TOPdesk using the credential stored in the variable Cred.

## PARAMETERS

### -Credential
A description of the Credential parameter.

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
A description of the UserType parameter.

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
Can be useful for troubleshooting or if you want to generate a login token to be consumed by a different applicaiton.

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
This is the Url of your topdesk instance.
Example: 'Company.TOPdesk.net'

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: (
			Get-PSFConfigValue -FullName TOPdeskPS.Url -NotNull)
Accept pipeline input: False
Accept wildcard characters: False
```

### -Register
Saves your TOPdesk url so you don't need to manually specify it each time.
For more information

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

### Inputs (if any)
## OUTPUTS

### Output (if any)
## NOTES
Additional information about the function.

## RELATED LINKS
