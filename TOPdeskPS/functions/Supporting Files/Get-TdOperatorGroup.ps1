function Get-TdOperatorGroup {
    <#
.SYNOPSIS
    Returns operator groups
.DESCRIPTION
    returns list of operator groups or groups for a provided operator.
.PARAMETER NameFragment
   Retrieve only operator groups with name starting with this. No wildcards
.PARAMETER OperatorId
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
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSPossibleIncorrectUsageOfAssignmentOperator", "", Justification = "I want to set the status to finished, dangit!")]
    param (
        [Parameter(Position = 0,
            ParameterSetName = 'List')]
        [string]$NameFragment,

        [Parameter(ValueFromPipelineByPropertyName, ParameterSetName = 'Operator')]
        [Alias('id')]
        $OperatorId,

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
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level InternalComment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -level InternalComment

        switch ($PsCmdlet.ParameterSetName) {
            Operator {
                $uri = "$(Get-TdUrl)/tas/api/operators/id/$OperatorId/operatorgroups"
                $res = Invoke-TdMethod -Uri $uri
                $res
            }

            List {
                $uri = (Get-TdUrl) + "/tas/api/operatorgroups/?"


                if ($Archived) {
                    $uri = "$uri&archived=$($archived.tostring().tolower())"
                }
                if ($NameFragment) {
                    $uri = "$uri&name=$NameFragment"
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

