---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Send-TdTaskNotification

## SYNOPSIS
Create custom task notifications

## SYNTAX

### Operator
```
Send-TdTaskNotification -Title <String> [-Body <String>] [-Url <String>] -OperatorId <String[]>
 [<CommonParameters>]
```

### OperatorGroup
```
Send-TdTaskNotification -Title <String> [-Body <String>] [-Url <String>] -OperatorGroupId <String[]>
 [<CommonParameters>]
```

## DESCRIPTION
Uses the TOPdesk Task Notification api to display task notifications.
This can display toast notifications through both Chrome and Firefox.

## EXAMPLES

### EXAMPLE 1
```
Send-TdTaskNotification -Title 'Example notification' -Body 'Your assistance is needed' -OperatorIds $Operator
```

Sends a notificiation to $Operator

## PARAMETERS

### -Title
The title of the custom notification.
It will be displayed as the first line of the notification.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Body
The body of the custom notification.
It will be displayed as the second line of the notification.

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

### -Url
A link that will be opened if the receiver of the notification clicks on the notification.
It must start with '/tas/secure/'

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

### -OperatorId
List of operator UUIDs to specify which operators this task notification will be sent to.
Both 'operatorGroupIds' and 'operatorIds can't be empty at the same time.
Non-existing operators will be silently ignored.

```yaml
Type: String[]
Parameter Sets: Operator
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OperatorGroupId
List of operator group UUIDs to specify which operators this task notification will be sent to.
Both 'operatorGroupIds' and 'operatorIds' can't be empty at the same time.
Non-existing operator groups will be silently ignored.

```yaml
Type: String[]
Parameter Sets: OperatorGroup
Aliases:

Required: True
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
