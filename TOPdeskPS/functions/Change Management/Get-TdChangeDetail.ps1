function Get-TdChangeDetail {
    <#
.SYNOPSIS
    returns details of a specified change
.DESCRIPTION
    returns details of a specified change
.PARAMETER ChangeNumber
    Change Number in format CYYMM-XXXX
.EXAMPLE
    PS C:\> Get-TdChange | Get-TdChangeDetail
    returns details of all changes
#>
    #TODO add support for change ID
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdChangeDetail')]

    param
    (
        [Parameter(
            mandatory = $true,
            ValueFromPipelineByPropertyName
        )]
        [Alias('number')]
        $ChangeNumber
    )
    begin {
        Write-PsfMessage "[$($MyInvocation.MyCommand.Name)] Function started" -level verbose
    }

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level InternalComment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -level InternalComment

        $uri = "$(Get-TdUrl)/tas/api/operatorChanges/$ChangeNumber"
        $res = Invoke-TdMethod -Uri $uri
        $res
    }
    end {
        Write-PSFMessage "Function Complete" -level Verbose
    }
}

