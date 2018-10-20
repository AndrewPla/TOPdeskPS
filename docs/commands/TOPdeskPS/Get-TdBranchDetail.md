---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Get-TdBranchDetail

## SYNOPSIS
Gets details of a branch

## SYNTAX

```
Get-TdBranchDetail -BranchId <Object> [<CommonParameters>]
```

## DESCRIPTION
Gets details of a branch by branchId

## EXAMPLES

### EXAMPLE 1
```
Get-TdBranchDetails -BranchId (Get-TdBranch -name 'examplebranch').id
```

Returns details about 'examplebranch'

## PARAMETERS

### -BranchId
ID of the branch.
See Get-TdBranch

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
