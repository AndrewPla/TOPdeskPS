function Get-TdOperatorGroup {
    <#
.SYNOPSIS
    returns list of operator groups
.DESCRIPTION
    returns list of operator groups
.PARAMETER Name
    Name of the operator group that you want returned. Wildcards are supported. Default value is '*'
.EXAMPLE
    PS C:\> Get-TdOperatorGroup
    returns list of operator groups
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdOperatorGroup')]

    param (
        [Alias('GroupName')]
        [system.string]$Name = '*'
    )
    begin {
        Write-PsfMessage "[$($MyInvocation.MyCommand.Name)] Function started" -level verbose
    }

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level internalcomment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -level internalcomment

        $uri = (Get-TdUrl) + "/tas/api/operatorgroups"
        $res = Invoke-TdMethod -Uri $uri
        $res  | Where-Object groupname -like $Name
    }
    end {
        Write-PSFMessage "Function Complete" -level verbose
    }
}

