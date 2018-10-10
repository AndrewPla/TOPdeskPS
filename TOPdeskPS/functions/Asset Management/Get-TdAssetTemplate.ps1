function Get-TdAssetTemplate {
    <#
    .SYNOPSIS
        Gets Asset Templates
    .DESCRIPTION
        This API returns the list of available templates/asset types with their IDs.
        You will need the ID when creating a new asset for that type or when filtering the list of assets on asset type.
    .PARAMETER Archived
        Whether to retrieve archived asset templates.  Leave out for all, or specify true/false for only archived, or only active templates, respectively.
    .PARAMETER Name
        Name of the AssetTemplate that you want returned.Wildcards are supported. Default value is '*'
    .EXAMPLE
        PS C:\> Get-TdAssetTemplate -Name 'Work*'
        returns all templates with a name matching 'work*'. In this instance it would return a 'Workstation' template.
    #>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdAssetTemplate')]
    param (
        [Parameter(Position = 0)]
        [System.String]
        $Name = '*',

        [switch]
        $Archived
    )
    Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
    $uri = (Get-TdUrl) + '/tas/api/assetmgmt/templates'
    Write-PSFMessage -Level InternalComment -Message "AssetTemplate url: $uri"

    if ($Archived) {
        Write-PSFMessage -Level InternalComment -Message "Archive = $Archive"
        $uri = "$uri/?archived=$Archived"
    }

    $Params = @{
        'uri' = $uri
    }
    $res = Invoke-TdMethod @Params | Select-Object -ExpandProperty dataset
    $res | Where-Object text -like $Name
}
