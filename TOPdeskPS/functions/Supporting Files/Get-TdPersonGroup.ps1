function Get-TdPersonGroup {
    <#
.SYNOPSIS
    returns list of person groups
.DESCRIPTION
    returns list of person groups
.PARAMETER NameFragment
   Retrieve only operator groups with name starting with this. No wildcards
.PARAMETER PersonId
    Id of the person that you want to return operator groups for.
.PARAMETER ResultSize
    The number of results that you want returned.
.PARAMETER Start
    The offset at which to start listing the operator groups at.
.PARAMETER Archived
    Specify whether you want archived operator groups included

.EXAMPLE
    PS> Get-TdPersonGroup -ResultSize 500 -Archived
    returns up to 500 person groups. Includes archived groups

.Example
PS > Get-TdPerson | Get-TdPersonGroup
Returns person groups for the provided persons
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdPersonGroup')]


    param (
        [Parameter(Position = 0,
            ParameterSetName = 'List')]
        [string]$NameFragment,

        [Parameter(ValueFromPipelineByPropertyName, ParameterSetName = 'Person')]
        [Alias('id')]
        $PersonId,

        [Parameter(ParameterSetName = 'List')]
        [ValidateRange(1, 100000)]
        [int]
        $ResultSize = 100,

        [Parameter(ParameterSetName = 'List')]
        [switch]
        $Archived,

        [Parameter(ParameterSetName = 'List')]
        [int]
        $Start = 0
    )

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level internalcomment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -level internalcomment

        $uri = (Get-TdUrl) + "/tas/api/persongroups"
        $res = Invoke-TdMethod -Uri $uri
        $res | Where-Object name -like $Name

        switch ($PsCmdlet.ParameterSetName) {
            Person {
                $uri = "$(Get-TdUrl)/tas/api/persongroups/lookup/$PersonId"
                Invoke-TdMethod -Uri $uri
            }

            List {
                $uri = (Get-TdUrl) + "/tas/api/persongroups/?"


                if ($Archived) {
                    $uri = "$uri&archived=$($archived.tostring().tolower())"
                }
                if ($NameFragment) {
                    $uri = "$uri&name=$NameFragment"
                }


                if ($ResultSize -gt 100) { $pageSize = 100 }
                else { $pageSize = $ResultSize }

                $uri = $uri.Replace('?&', '?')
                $count = 0


                do {
                    $groups = @()

                    $remaining = $ResultSize - $count

                    if ($remaining -le 100) {
                        $pageSize = $remaining
                        $status = 'finished'
                    }

                    $loopingUri = "$uri&start=$Start&page_size=$pageSize"

                    $Params = @{
                        'uri' = $loopingUri.replace('?&', '?')
                    }

                    $groups = Invoke-TdMethod @Params
                    foreach ($group in $groups) {
                        if ($group.id) { $group }
                        else { $status = 'finished' }
                    }
                    if (($groups.count) -eq $remaining) {
                        $status = 'finished'
                    }


                    $remaining = $ResultSize - $count
                    if ($remaining = 0) { $status = 'finished' }
                    $count += $groups.count
                    $start += $PageSize
                }
                until ($status -like 'finished')
            }
        }

    }
}

