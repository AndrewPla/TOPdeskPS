function New-TdBudgetHolder {
    <#
    .SYNOPSIS
        Creates new BudgetHolder
    .DESCRIPTION
        creates new budgetholder
    .PARAMETER Name
        The name of the budget holder.
    .PARAMETER ExternalLinkID
        Id of the entity in the external system
    .PARAMETER Confirm
        If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.
    .PARAMETER WhatIf
        If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.
    .PARAMETER ExternalLinkType
        The Type of the link.
    .EXAMPLE
    PS C:\> New-TdBudgetHolder -Name 'Management'
    Creates a new budget holdernamed 'management'
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/New-TdBudgetHolder',
        SupportsShouldProcess = $true)]
    param
    (
        [Parameter(Mandatory, ParameterSetName = 'Name')]
        [System.string]$Name,

        [Parameter(Mandatory, ParameterSetName = 'ExternalLink')]
        [System.String]$externalLinkId,

        [Parameter(Mandatory, ParameterSetName = 'ExternalLink')]
        [System.string]$ExternalLinkType
    )
    begin {
        Write-PsfMessage "[$($MyInvocation.MyCommand.Name)] Function started" -level verbose
    }

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level internalcomment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -level internalcomment

        $uri = (Get-TdUrl) + "/tas/api/budgetholders"
        $body = [PSCustomObject]@{}

        $Body | Add-Member -MemberType NoteProperty -Name 'name' -Value $name
        if ($pscmdlet.ParameterSetName -eq 'ExternalLink') {
            $externalLink = [PSCustomObject]@{
                id = $ExternalLinkId
                type = $ExternalLinkType
            }
            $body | Add-Member -MemberType NoteProperty -Name 'externalLink' -Value $externalLink
        }
        if (-not (Test-PSFShouldProcess -PSCmdlet $PSCmdlet -Target $uri -Action 'Sending Request')) {
            return
        }
        Invoke-TdMethod -Uri $uri -Body ($body | Convertto-json) -Method POST
    }
    end {
        Write-PSFMessage "Function Complete" -level verbose
    }
}

