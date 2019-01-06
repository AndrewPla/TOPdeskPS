function Get-TdOperatorAvatar {
    <#
.SYNOPSIS
    Returns avatar of operator
.DESCRIPTION
    Returns avatar of operator based on the operatorid
.PARAMETER OperatorId
    ID of the operator. See Get-TdOperator
.EXAMPLE
    PS C:\> Get-TdOperatorAvatar -OperatorId (Get-TdOperator -TOPdeskLoginName 'User@company.com').id
    Returns the Avatar for 'User@company.com'
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdOperatorAvatar')]

    param
    (
        [Parameter(
            mandatory = $true,
            ValueFromPipelineByPropertyName
        )]
        [Alias('Id')]
        $OperatorId
    )
    begin {
        Write-PsfMessage "[$($MyInvocation.MyCommand.Name)] Function started" -level verbose
    }

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level internalcomment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -level internalcomment

        $uri = (Get-TdUrl) + "/tas/api/avatars/operator/$OperatorId"
        $res = Invoke-TdMethod -Uri $uri
        $res
    }
    end {
        Write-PSFMessage "Function Complete" -level verbose
    }
}

