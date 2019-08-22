function Get-TdAssetTemplateBlank {
    <#
	.SYNOPSIS
		Returns blank asset cards
	.DESCRIPTION
    This API returns a blank asset card based on a specific template. You can add the id or name of the specific template as a parameter to the endpoint (templateid / templateName). The result will show all the fields on the card, and their properties.
    You can use this endpoint to see the mandatory fields of the asset, and with that, create new assets of that type.    .PARAMETER NameFragment
    To filter assets by their name-fragment use this parameter. It’s case-insensitive.
    .PARAMETER TemplateName
        Name of the tempalte
    .PARAMETER Id
    Id of the template that you want returned. See Get-TdAssetTemplate
	.EXAMPLE
        PS > Get-TdAssetTemplateBlank -TemplateName 'Network Device'
        Returns all fields on the card for the template specified.
    .Example
        PS > Get-TdAssetTemplate Network | Get-TdAssetTemplateBlank
        Returns a blank template for the Network Asset template
#>

    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdAssetTemplateBlank',
        DefaultParameterSetName = 'id')]
    param
    (
        [Parameter(Mandatory = $true, ParameterSetName = 'name')]
        [Alias('Name')]
        [system.string]$TemplateName,

        [Parameter(Mandatory = $true, ParameterSetName = 'id', ValueFromPipelineByPropertyName)]
        [system.string]$Id
    )

    process {
        $uri = "$(get-tdurl)/tas/api/assetmgmt/assets/blank"
        if ($templateName) {
            $uri = "$uri/?templateName=$TemplateName"
        }
        if ($Id) {
            $uri = "$uri/?templateId=$Id"
        }
        Invoke-TdMethod $uri
    }

}
