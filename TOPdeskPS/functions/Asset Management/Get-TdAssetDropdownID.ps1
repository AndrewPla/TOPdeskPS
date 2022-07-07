function Get-TdAssetDropdownID {
    <#
	.SYNOPSIS
		Gets a dropdown option id based on a name, and creates it if doesn’t exist.
	.DESCRIPTION
		If an option with the given name (case-insensitive) already exists, the ID of that option is returned. If the existing option was archived, it will be unarchived. If no option with the given name exists, a new option is created, and the ID of the created option is returned.
    .PARAMETER DropdownMenuName
        The name of Dropdown menu
    .PARAMETER DropdownOptionName
        The name of Dropdown option to get the id of.
	.EXAMPLE
        PS C:\> $DropdownOptionID = Set-TdAssetDropdown -DropdownMenuName $DropdownMenuName -DropdownOptionName $DropdownOptionName
        Returns the ID of the dropdown option
	#>

    [CmdletBinding(HelpUri = 'https://developers.topdesk.com/explorer/?page=assets#/Asset%20Management%20Import%20API/getOrCreateDropdownValue',
        SupportsShouldProcess = $true)]
    param
    (
		[Parameter(Mandatory = $true)]
		[system.string]
		$DropdownMenuName,

		[Parameter(Mandatory = $true)]
		[system.string]
		$DropdownOptionName

    )

    process {
        Write-PSFMessage -Level InternalComment -Message "[$($MyInvocation.MyCommand.Name)] PSBoundParameters: $($PSBoundParameters | Out-String)"

        $uri = (Get-TdUrl) + "/tas/api/assetmgmt/dropdowns/$DropdownMenuName"

        $body = [PSCustomObject]@{'name' = $DropdownOptionName}
		
		Write-PSFMessage "$($Body | ConvertTo-Json | Out-String)" -Level debug

	   $params = @{
            'Uri' = $uri
            'Body' = $body | ConvertTo-Json
            'Method' = 'Post'
        }
        if (-not (Test-PSFShouldProcess -PSCmdlet $PSCmdlet -Target $uri -Action 'Geting dropdown option id.')) {
            return
        }
        Invoke-TdMethod @params | Select-Object -ExpandProperty id
    }

}