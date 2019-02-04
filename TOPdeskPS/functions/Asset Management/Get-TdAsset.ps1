function Get-TdAsset {
    <#
	.SYNOPSIS
		Returns TOPdesk assets
	.DESCRIPTION
        This API returns a list of assets. By default the following fields are included: id, name (text), etag and state (archived).
         You can use various parameters to filter this list or to retrieve other fields from the assets. In Asset Management, paging is missing deliberately.
         To return all assets for a given template please use the TemplateId parameter. You can also specify the fields that you would like returned when performing a template query.
    .PARAMETER NameFragment
        To filter assets by their name-fragment use this parameter. It’s case-insensitive.
    .PARAMETER Archived
        Whether to show archived assets. if performing a standard query it will return all, if performing a Tempalte query it will only return active assets.
    .PARAMETER TemplateName
        To filter assets by a specific template’s name (case sensitive).
    .PARAMETER ShowAssignments
        When it’s given it returns more meta information, including all person and location related assignments. See ‘/assignments’ endpoint documentation for more details about the response format.
    .PARAMETER TemplateId
        Id of the template specifying the type of assets to return. see Get-Tdtemplate to retrieve the id.
    .PARAMETER Field
        Which asset fields to include in the response. If not specified, only the id and name will be included. Fields should be referenced by their field id, not their display name. See Get-tdAssetField

	.EXAMPLE
		PS C:\> Get-TdAsset
		Get all topdesk assets
#>

    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdAsset', DefaultParameterSetName = 'List')]

    param
    (

        [Parameter(ParameterSetName = 'Standard Query')]
        [system.string]$NameFragment,

        [switch]$Archived,

        [Parameter(ParameterSetName = 'Standard Query')]
        [switch]$ShowAssignments,

        [Parameter(ParameterSetName = 'Standard Query')]
        [system.string]$TemplateName,

        # This is a different query so we need a seperate parameter set.
        [Parameter(Mandatory, ParameterSetName = 'Template Query')]
        $TemplateId,

        [system.string[]]
        $Field = 'name'
    )

    begin {
        Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
    }
    process {
        switch ($PsCmdlet.ParameterSetName) {
            'Standard Query' {
                $Uri = (Get-TdUrl) + '/tas/api/assetmgmt/assets/?'
                switch ($PSBoundParameters.keys) {
                    NameFragment {
                        $uri = "$uri&nameFragment=$NameFragment"
                    }
                    Archived {
                        $uri = "$uri&archived=$Archived"
                    }
                    ShowAssignments {
                        $uri = "$uri&showAssignments=$ShowAssignments"
                    }
                    TemplateName {
                        $uri = "$uri&templateName=$TemplateName"
                    }
                }
                Invoke-TdMethod -Uri $uri | Select-Object -ExpandProperty dataset  | Select-PSFObject -Typename 'TOPdeskPS.Asset' -KeepInputObject
            }

            'Template Query' {
                switch ($PSBoundParameters.Keys) {
                    TemplateId {
                        $uri = (get-tdurl) + "/tas/api/assetmgmt/assets/templateId/$TemplateId/?"
                    }
                    Archived {
                        $uri = $uri + "&includeArchived=$Archived/"
                    }
                }
                foreach ($f in $field) {
                    $uri = $uri + "&field=$F"
                }
                Invoke-TdMethod -Uri $uri | Select-Object -ExpandProperty results | Select-PSFObject -Typename 'TOPdeskPS.Asset' -KeepInputObject
            }

            List {
                $Uri = (Get-TdUrl) + '/tas/api/assetmgmt/import/assets/?'

                foreach ($f in $field) {
                    $uri = $uri + "&field=$F"
                }
                Invoke-TdMethod -Uri $uri  | Select-Object -ExpandProperty results
            }
        }
    }
    end {
    }
}
