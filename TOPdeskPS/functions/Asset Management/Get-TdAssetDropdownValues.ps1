function Get-TdAssetDropdownValues {
    <#
	.SYNOPSIS
		Returns the possible values of the dropdown fields in TOPdesk Asset Templates
	.DESCRIPTION
        In Asset Templates it is possible to define dropdown items. For example, it is possible to create a dtap dropdown item with the items development, test, acceptance and production.
        This function returns the possible values (development, test, acceptance and production) of a given dropdown item (dtap)
    .PARAMETER DropdownID
        Required. Name of the dropdown item in the asset template. Please note that the description in the GUI (text label) might be different from the dropdown name/ID.
        You can find the dropdown name as follows:
        - Call /assetmgmt/cardTypes to find the templates and fields with the templates.
        - Call /assetmgmt/fields/<fieldId> (Get-TdAssetFieldValue) to find the field definition and filter for dropdown items.
    .PARAMETER Archived
        If true, the function also returns the archived values of the drop down item.
        If false, only the non-archived values are returned.
    .PARAMETER Field
        Be default only the TOPdesk IDs of the dropdown values are returned. You can specify additional fields to be returned. Currently, only the field 'name' is supported in TOPdesk.
        The default value for this parameter is 'name', so currently there is no need to specify this parameter.
	.EXAMPLE
    Get-TdAssetDropdownValues -DropdownID dtap

    name        id
    ----        --
    Development dddddddd-dddd-dddd-dddd-dddddddddddd
    Acceptance  aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa
    Production  pppppppp-pppp-pppp-pppp-pppppppppppp

    Get-TdAssetDropdownValues -DropdownID dtap -Archived

    name        id
    ----        --
    Development dddddddd-dddd-dddd-dddd-dddddddddddd
    Test        tttttttt-tttt-tttt-tttt-tttttttttttt
    Acceptance  aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa
    Production  pppppppp-pppp-pppp-pppp-pppppppppppp
   #>

    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdAssetDropdownValues')]

    param
    (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)][Alias('id')][String]$DropdownID,

        [switch]$Archived,

        [system.string[]]
        $Field = 'name'
    )

    begin {
        Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters | Out-String)" -Tag 'debug', 'start', 'param'
    }
    process {
        $Uri = (Get-TdUrl) + '/tas/api/assetmgmt/dropdowns/' + $DropdownID + '?'

        if ($Archived -ne $null) {
            $uri = "$uri&includeArchived=$Archived"
        }

        if ($Field -ne $null) {
            $uri = $uri + '&field=' + ($field -join ",")
        }

        Invoke-TdMethod -Uri $uri | Select-Object -ExpandProperty results | Select-PSFObject -Typename 'TOPdeskPS.DropdownValues' -KeepInputObject
    }
    end {
    }
}
