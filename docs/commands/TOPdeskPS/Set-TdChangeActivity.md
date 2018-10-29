---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version: https://andrewpla.github.io/TOPdeskPS/commands/Set-TdChangeActivity
schema: 2.0.0
---

# Set-TdChangeActivity

## SYNOPSIS
{{Fill in the Synopsis}}

## SYNTAX

```
Set-TdChangeActivity [-ActivityTemplate <Object>] -ChangeId <Object> [-BriefDescription <String>]
 [-ChangePhase <String>] [-ActivityType <String>] [-PlannedStartDate <String>] [-PlannedFinalDate <String>]
 [-AssigneeId <String>] [-AssigneeGroupId <Object>] [-AssigneeType <String>] [-Status <String>]
 [-Category <String>] [-Subcategory <String>] [-Request <String>] [-Action <String>]
 [-OptionalFields1 <Hashtable>] [-OptionalFields2 <Hashtable>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
{{Fill in the Description}}

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -Action
{{Fill Action Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ActivityTemplate
{{Fill ActivityTemplate Description}}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ActivityType
{{Fill ActivityType Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: normal, authorization

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AssigneeGroupId
{{Fill AssigneeGroupId Description}}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -AssigneeId
{{Fill AssigneeId Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AssigneeType
{{Fill AssigneeType Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: manager, operator

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -BriefDescription
{{Fill BriefDescription Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Category
{{Fill Category Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ChangeId
{{Fill ChangeId Description}}

```yaml
Type: Object
Parameter Sets: (All)
Aliases: Id

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ChangePhase
{{Fill ChangePhase Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: rfc, progress, evaluation

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

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

### -OptionalFields1
{{Fill OptionalFields1 Description}}

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OptionalFields2
{{Fill OptionalFields2 Description}}

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PlannedFinalDate
{{Fill PlannedFinalDate Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PlannedStartDate
{{Fill PlannedStartDate Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Request
{{Fill Request Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Status
{{Fill Status Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Subcategory
{{Fill Subcategory Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.Object

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS

[https://andrewpla.github.io/TOPdeskPS/commands/Set-TdChangeActivity](https://andrewpla.github.io/TOPdeskPS/commands/Set-TdChangeActivity)

