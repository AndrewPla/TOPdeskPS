function Get-TdChangeTemplate {
    <#
.SYNOPSIS
    returns list of all templates used to create new requests for changes
.DESCRIPTION
    returns list of all templates used to create new requests for changes
.EXAMPLE
    PS C:\> Get-TdChangeTemplate
    returns list of all templates used to create new requests for change
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdChangeTemplate')]

    param
    (

    )
    begin {
        Write-PsfMessage "[$($MyInvocation.MyCommand.Name)] Function started" -level verbose
    }

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level InternalComment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -level InternalComment

        $uri = "$(Get-TdUrl)/tas/api/applicableChangeTemplates"
        $res = Invoke-TdMethod -Uri $uri
        $res
    }
    end {
        Write-PSFMessage "Function Complete" -level Verbose
    }
}

