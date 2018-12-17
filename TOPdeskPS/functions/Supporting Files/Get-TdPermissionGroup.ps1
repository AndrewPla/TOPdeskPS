function Get-TdPermissionGroup {
    <#
.SYNOPSIS
    returns list of permission groups
.DESCRIPTION
    returns list of permission groups
.PARAMETER Name
    Name of the operator group that you want returned. Wildcards are supported. Default value is '*'
.EXAMPLE
    PS C:\> Get-TdPermissionGroup
    returns list of permission groups
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdPermissionGroup')]

    param (
        [Alias('GroupName')]
        [system.string]$Name = '*'
    )

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level internalcomment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -level internalcomment

        $uri = (Get-TdUrl) + "/tas/api/permissiongroups"
        $res = Invoke-TdMethod -Uri $uri
        $res  | Where-Object groupname -like $Name
    }

}

