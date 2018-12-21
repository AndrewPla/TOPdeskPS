function Get-TdOperatorGroup {
    <#
.SYNOPSIS
    Returns operator groups
.DESCRIPTION
    returns list of operator groups or groups for a provided operator.
.PARAMETER Name
   Retrieve only operator groups with name starting with this.
.PARAMETER Operator
    Id of the operator that you want to return operator groups for.
.PARAMETER ResultSize
    The number of results that you want returned.
.PARAMETER Start
    The offset at which to start listing the operator groups at. Must be greater or equal to 0, default is 0
.PARAMETER Archived
    Specify whether you want archived operator groups included
.EXAMPLE
    PS C:\> Get-TdOperatorGroup -resultsize 1000
    returns up to 1000 operator groups.
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdOperatorGroup',
        DefaultParameterSetName = 'List')]

    param (
        [Parameter(Position = 0,
            ParameterSetName = 'List')]
        [string]$Name,

        [Parameter(ValueFromPipelineByPropertyName, ParameterSetName = 'Operator')]
        [Alias('id')]
        $Operator,

        [Parameter(ParameterSetName = 'List')]
        [ValidateRange(1, 100000)]
        [int]
        $ResultSize = 10,

        [Parameter(ParameterSetName = 'List')]
        [switch]
        $Archived,

        [Parameter(ParameterSetName = 'List')]
        [int]
        $Start = 0
    )

    process {
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -level internalcomment

        switch ($PsCmdlet.ParameterSetName) {
            Operator {
                $uri = "$(Get-TdUrl)/tas/api/operators/id/$Operator/operatorgroups"
                $res = Invoke-TdMethod -Uri $uri
                $res | Where-Object groupname -like $Name
            }

            List {
                $uri = (Get-TdUrl) + "/tas/api/operatorgroups/?"
                Switch ($PSBoundParameters.keys) {
                    Archived {
                        $uri = "$uri&archived=$($archived.tostring().tolower())"
                    }
                    Name {
                        $uri = "$uri&name=$name"
                    }
                }

                if ($ResultSize -gt 100) {$pageSize = 100}
                else { $pageSize = $ResultSize }

                $uri = $uri.Replace('?&', '?')
                $count = 0


                do {
                    $groups = @()

                    $remaining = $ResultSize - $count
                    Write-PSFMessage "$remaining groups remaining"

                    if ($remaining -le 100) {
                        $pageSize = $remaining
                        $status = 'finished'
                    }

                    $loopingUri = "$uri&start=$Start&page_size=$pageSize"
                    $Params = @{
                        'uri' = $loopingUri.replace('?&', '?')
                    }

                    $groups += Invoke-TdMethod @Params
                    foreach ($group in $groups) {
                        if ($group.id) {$group}
                        else {$status = 'finished'}
                    }
                    if (($groups.count) -eq $remaining) {
                        Write-PSFMessage 'No groups remaining.'
                        $status = 'finished'
                    }


                    $remaining = $ResultSize - $count
                    if ($remaining = 0) { $status = 'finished'}
                    $count += $groups.count
                    $start += $PageSize
                }
                until ($status -like 'finished')
            }
        }
    }
}

