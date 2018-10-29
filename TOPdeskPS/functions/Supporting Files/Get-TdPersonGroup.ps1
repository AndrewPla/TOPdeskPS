function Get-TdPersonGroup {
    <#
.SYNOPSIS
    returns list of person groups
.DESCRIPTION
    returns list of person groups
.PARAMETER Name
    Name of the person group that you want returned. Wildcards are supported. default '*'
.EXAMPLE
    PS C:\> Get-TdPersonGroup
    returns list of person groups
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdPersonGroup')]


    param (
        [system.string]$Name = '*'
    )
    begin {
        Write-PsfMessage "[$($MyInvocation.MyCommand.Name)] Function started" -level verbose
    }

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level internalcomment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -level internalcomment

        $uri = (Get-TdUrl) + "/tas/api/persongroups"
        $res = Invoke-TdMethod -Uri $uri
        $res | Where-Object name -like $Name
    }
    end {
        Write-PSFMessage "Function Complete" -level verbose
    }
}

