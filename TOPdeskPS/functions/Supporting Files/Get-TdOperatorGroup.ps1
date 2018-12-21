function Get-TdOperatorGroup {
    <#
.SYNOPSIS
    Returns operator groups
.DESCRIPTION
    returns list of operator groups or groups for a provided operator.
.PARAMETER Name
    Name of the operator group that you want returned. Wildcards are supported. Default value is '*'
.PARAMETER Operator
    Id of the operator that you want to return operator groups for.
.EXAMPLE
    PS C:\> Get-TdOperatorGroup
    returns list of operator groups
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdOperatorGroup')]

    param (
        [Parameter(ParameterSetName = 'List')]
        [system.string]$Name = '*',

        [Parameter(ValueFromPipelineByPropertyName, ParameterSetName = 'Operator')]
        [Alias('id')]
        $Operator
    )

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level internalcomment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -level internalcomment

        switch ($PsCmdlet.ParameterSetName) {
            List {
                $uri = (Get-TdUrl) + "/tas/api/operatorgroups"
                $res = Invoke-TdMethod -Uri $uri
                $res  | Where-Object groupname -like $Name
            }

            Operator {

                $uri = "$(Get-TdUrl)/tas/api/operators/id/$Operator/operatorgroups"
                $res = Invoke-TdMethod -Uri $uri
                $res
            }
        }



    }

}

