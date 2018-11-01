---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version: https://developers.topdesk.com/explorer/?page=change#/Working%20as%20an%20operator/patch_operatorChanges__identifier_
schema: 2.0.0
---

# Set-TdChange

## SYNOPSIS
Sort of sets a change, this is poorly supported by TOPdesk :/

## SYNTAX

```
Set-TdChange [-ChangeId] <String> [-BodyInput] <Object> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
does most of the change setting, poorly supported by TOPdesk, read the .LINK

## EXAMPLES

### EXAMPLE 1
```
Set-TdChange -ChangeId 'C1807-627' -BodyInput 'body text'
```

sets the body of specified change.
this api is poorly supported by TOPdesk

## PARAMETERS

### -ChangeId
Id of the Change Request to be altered

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -BodyInput
formatted input to match the example value linked to in the .LINK

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://developers.topdesk.com/explorer/?page=change#/Working%20as%20an%20operator/patch_operatorChanges__identifier_](https://developers.topdesk.com/explorer/?page=change#/Working%20as%20an%20operator/patch_operatorChanges__identifier_)

