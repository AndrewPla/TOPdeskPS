function Get-TdAssetTemplateBlank {
    <#
	.SYNOPSIS
		Returns blank asset cards
	.DESCRIPTION
    This API returns a blank asset card based on a specific template. You can add the id or name of the specific template as a parameter to the endpoint (templateid / templateName). The result will show all the fields on the card, and their properties.
    You can use this endpoint to see the mandatory fields of the asset, and with that, create new assets of that type.    .PARAMETER NameFragment
    To filter assets by their name-fragment use this parameter. It’s case-insensitive.
    .PARAMETER TemplateName
        Name of the templateid
	.EXAMPLE
        PS C:\> Get-TdAssetTemplateBlank -TemplateName 'Network Device'
		Returns all fields on the card for the template specified.
#>

    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdAssetTemplateBlank')]
    param
    (
        [Parameter(Mandatory = $true)]
        [system.string]$TemplateName
    )

    begin {
        Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
    }
    process {
        $uri = (get-tdurl) + "/tas/api/assetmgmt/assets/blank/?templateName=$TemplateName"

        #TODO replace this with an internal function
        if ($uri[-1] -match '&') {
            Write-PSFMessage 'Trimming &' -Level debug
            $RemoveCount = $uri.length - 1
            $uri.remove($removeCount)
        }

        $Params = @{
            'uri' = $uri
        }
        Invoke-TdMethod @Params
    }
    end {
    }
}