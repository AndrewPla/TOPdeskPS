function Add-TdAssetAssignment {
    <#
	.SYNOPSIS
		Adds an assignment to an asset
	.DESCRIPTION
		Updates the given asset.It may be possible that one or more assets couldn’t be deleted because they have existing links from other components. In this case those assets’ ids will be listed in the ‘failed’ list of the response, but it doesn’t affect deletion of other assets.
    .PARAMETER AssetId
        ID of asset which is the subject of the assignment
    .PARAMETER LinkType
        Some of the other ID parameters must be also provided based on the current linkType. Available values: branch, location, person, personGroup
    .PARAMETER LinkToId
        ID of the assigned entity. If it's a location, parent branch ID must be also provided.
    .PARAMETER BranchId
        Id of the branch you want to assign. If location is linked, this ID must be also provided as the parent branch ID of the location. Run Get-TdBranch for more
    .PARAMETER Body
        This is the body of the request. Use this to create your own bodies if the parameters aren't providing you with what you need.
	.PARAMETER Confirm
		If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.
	.PARAMETER WhatIf
		If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.
	.EXAMPLE
		PS C:\> Set-TdAsset -AssetId $AssetId
        Removes all assets with id's inside $assetId.
    .NOTES see for more: https://developers.topdesk.com/explorer/?page=assets&version=1.5.1#/Assets/update
#>

    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/TOPdeskPS/Add-TdAssetAssignment',
        SupportsShouldProcess = $true)]
    param
    (
        [Parameter(Mandatory = $true,
            ValueFromPipelineByPropertyName = $true)]
        [Alias('Id')]
        [system.string]
        $AssetId,

        [Parameter(Mandatory)]
        [ValidateSet('branch', 'location', 'person', 'personGroup')]
        [system.string]
        $LinkType,

        [system.string]
        $LinkToId,

        [system.string]
        $BranchId,

        [Parameter(ParameterSetName = 'Body')]
        [pscustomobject]$Body
    )

    begin {}
    process {
        Write-PSFMessage -Level InternalComment -Message "[$($MyInvocation.MyCommand.Name)] ParameterSetName: $($PsCmdlet.ParameterSetName)"
        Write-PSFMessage -Level InternalComment -Message "[$($MyInvocation.MyCommand.Name)] PSBoundParameters: $($PSBoundParameters | Out-String)"

        $uri = (Get-TdUrl) + "/tas/api/assetmgmt/assets/$AssetId/assignments"

        Write-PSFMessage "$($Body | ConvertTo-Json | Out-String)" -Level debug

        $body = [pscustomobject]@{}

        switch ($PSBoundParameters.Keys) {
            LinkType {
                $body | Add-Member -MemberType NoteProperty -Name linkType -Value $LinkType
            }
            LinkToId {
                $body | Add-Member -MemberType NoteProperty -Name linkToId -Value $LinkToId
            }
            BranchId {
                $body | Add-Member -MemberType NoteProperty -Name branchId -Value $BranchId
            }
        }
        $params = @{
            'Uri'    = $uri
            'Body'   = $body | ConvertTo-Json
            'Method' = 'Put'
        }
        if (-not (Test-PSFShouldProcess -PSCmdlet $PSCmdlet -Target $uri -Action 'adding asset assignment.')) {
            return
        }
        Invoke-TdMethod @params
    }
    end {}
}