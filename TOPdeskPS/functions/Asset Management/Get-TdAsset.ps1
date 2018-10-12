function Get-TdAsset {
    <#
	.SYNOPSIS
		Returns TOPdesk assets
	.DESCRIPTION
        This API returns a list of assets. By default the following fields are included: id, name (text), etag and state (archived).
         You can use various parameters to filter this list or to retrieve other fields from the assets. In Asset Management, paging is missing deliberately.
    .PARAMETER NameFragment
        To filter assets by their name-fragment use this parameter. It’s case-insensitive.
    .PARAMETER Archived
        Whether to show archived assets. Leave out for all, or specify true/false for only archived, or only active assets, respectively.
    .PARAMETER TemplateName
        To filter assets by a specific template’s name (case sensitive).
    .PARAMETER ShowAssignments
        When it’s given it returns more meta information, including all person and location related assignments. See ‘/assignments’ endpoint documentation for more details about the response format.
	.EXAMPLE
		PS C:\> Get-TdAsset
		Get all topdesk assets
#>

    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdAsset')]
    param
    (
        [system.string]$NameFragment,
        [switch]$Archived,
        [switch]$ShowAssignments,
        [system.string]$TemplateName

    )

    begin {
        Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
    }
    process {
        if ($PSBoundParameters.keys -eq '') {
            $Uri = (Get-TdUrl) + '/tas/api/assetmgmt/assets'
        }
        else {
            $Uri = (Get-TdUrl) + '/tas/api/assetmgmt/assets/?'
        }

        if ($PSBoundParameters.keys -contains 'NameFragment') {
            $uri = "$uri&nameFragment=$NameFragment&"
        }
        if ($PSBoundParameters.keys -contains 'Archived') {
            $uri = "$uri&archived=$Archived&"
        }
        if ($PSBoundParameters.keys -contains 'ShowAssignments') {
            $uri = "$uri&showAssignments=$ShowAssignments&"
        }
        if ($PSBoundParameters.keys -contains 'TemplateName') {
            $uri = "$uri&templateName=$TemplateName&"
        }

        if ($uri[-1] -match '&') {
            Write-PSFMessage 'Trimming &' -Level debug
            $RemoveCount = $uri.length - 1
            $uri.remove($removeCount) | Out-Null
        }
        $Params = @{
            'uri' = $uri
        }
        $res = Invoke-TdMethod @Params
        $res | Select-Object -ExpandProperty dataset
    }
    end {
    }
}