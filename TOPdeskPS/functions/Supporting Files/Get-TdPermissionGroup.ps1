function Get-TdPermissionGroup {
    <#
.SYNOPSIS
    returns list of permission groups
.DESCRIPTION
    returns list of permission groups
.EXAMPLE
    PS C:\> Get-TdPermissionGroup
    returns list of permission groups
#>
[CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdPermissionGroup')]

    param
    (

    )
    begin {
        Write-PsfMessage "[$($MyInvocation.MyCommand.Name)] Function started" -level verbose
        }

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level internalcomment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -level internalcomment

        $uri = (Get-TdUrl) + "/tas/api/permissiongroups"
        $res = Invoke-TdMethod -Uri $uri
        $res
    }
    end {
        Write-PSFMessage "Function Complete" -level verbose
    }
}

