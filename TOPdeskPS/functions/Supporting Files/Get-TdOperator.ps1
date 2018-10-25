function Get-TdOperator {
    <#
.SYNOPSIS
    returns list of operators
.DESCRIPTION
    returns list of operators
.PARAMETER Name
    human readable name to filter for operator by. Uses the dynamcName field
.EXAMPLE
    PS C:\> Get-TdOperator
    returns list of operators
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdOperator')]

    param
    (
        [string]
        $Name
    )
    begin {
        Write-PsfMessage "[$($MyInvocation.MyCommand.Name)] Function started" -level verbose
    }

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level internalcomment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -level internalcomment

        $uri = (Get-TdUrl) + "/tas/api/operators"
        $res = Invoke-TdMethod -Uri $uri
        if ($name) {
            $res | Where-Object dynamicName -like $Name
        }
        else {
            $res
        }
    }
    end {
        Write-PSFMessage "Function Complete" -level verbose
    }
}

