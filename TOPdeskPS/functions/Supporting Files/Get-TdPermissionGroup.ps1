function Get-TdPermissionGroup {
    <#
.SYNOPSIS
    returns list of permission groups
.DESCRIPTION
    returns list of permission groups
.PARAMETER Name
    Name of the operator group that you want returned. Wildcards are supported. Default value is '*'
.PARAMETER Operator
    Id of the operator that you want to return the permission groups for
.EXAMPLE
    PS C:\> Get-TdPermissionGroup
    returns list of permission groups
.EXAMPLE
    PS C:\>  Get-TdOperator -TOPdeskloginName 'Juanita Smith' | Get-TdPermissionGroup
    returns permission groups for Juanita Smith
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdPermissionGroup')]

    param (
        [Parameter(Position = 0)]
        [Alias('GroupName')]
        [system.string]$Name = '*',

        [Parameter(ParameterSetName = 'Operator', ValueFromPipelineByPropertyName)]
        [Alias('id')]
        [string]
        $Operator
    )

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level internalcomment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -level internalcomment

        switch ($PsCmdlet.ParameterSetName) {
            __AllParameterSets {
                $uri = (Get-TdUrl) + "/tas/api/permissiongroups"
                $res = Invoke-TdMethod -Uri $uri
                $res  | Where-Object name -like $Name
            }

            Operator {
                $uri = "$(get-tdurl)/tas/api/operators/id/$Operator/permissiongroups"
                $res = Invoke-TdMethod -Uri $uri
                $res
            }
        }
    }

}

