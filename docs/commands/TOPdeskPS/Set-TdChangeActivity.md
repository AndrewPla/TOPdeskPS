---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version: https://developers.topdesk.com/explorer/?page=change#/Working%20as%20an%20operator/patch_operatorChangeActivities__identifier_
schema: 2.0.0
---

# Set-TdChangeActivity

## SYNOPSIS
modifies an existing activity within a change

## SYNTAX

```
Set-TdChangeActivity [-ActivityId] <Object> [-InputObject] <Object> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Updates a change activity with the provided op, path, and value.
Also triggers Events and Actions.
Note!
Actions that require user interaction like "Confirm before sending"
or "Editable before sending" will not be executed.

When status determines processing status is enabled the /processingStatus field is ignored.

## EXAMPLES

### EXAMPLE 1
```
$object = [pscustomobject]@()
```

PS\> $object += @{ op = 'add'; path = '/progressTrail'; value = 'a message from PS!'}
PS\> $object += @{ op = 'replace'; path = '/briefDescription'; value = 'A New Description'}
PS\> Set-TdChangeActivity -ActivityId $activityid -InputObject $object

InputObject must be an array, each action to be taken on the Activity is an object inside the InputObject

## PARAMETERS

### -ActivityId
{{Fill ActivityId Description}}

```yaml
Type: Object
Parameter Sets: (All)
Aliases: Id

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -InputObject
This is an object containing the Path, op, and value.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByValue)
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

[https://developers.topdesk.com/explorer/?page=change#/Working%20as%20an%20operator/patch_operatorChangeActivities__identifier_](https://developers.topdesk.com/explorer/?page=change#/Working%20as%20an%20operator/patch_operatorChangeActivities__identifier_)

