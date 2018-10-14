---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Get-TdAssetCapabilityDetail

## SYNOPSIS
Returns details about asset capabilities

## SYNTAX

```
Get-TdAssetCapabilityDetail [-CapabilityId] <String> [<CommonParameters>]
```

## DESCRIPTION
Assets can be linked together with capabilities.
This command returns all of them.

## EXAMPLES

### EXAMPLE 1
```
Get-TdAssetCapability | Get-TdAssetCapabilityDetail
```

Returns additional detail about asset capabilities

## PARAMETERS

### -CapabilityId
Id of the capability.
Use Get-TdAssetCapability

```yaml
Type: String
Parameter Sets: (All)
Aliases: id

Required: True
Position: 1
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
