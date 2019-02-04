function New-TdAsset {
    <#
    .SYNOPSIS
        Create a new asset
    .DESCRIPTION
        This API creates a new asset. To create a new asset, you will need the type of the asset you want to create (type_id), and to fill in the values of the mandatory fields of that specific asset type/template. You can get the ID of the available types of assets/templates using the /assetmgmt/templates endpoint. use Get-TdAssetTemplateBlank
    .PARAMETER TemplateId
        The ID of the template.
    .PARAMETER Name
        The Name, or assetId of the asset that you want to create. Example: TestComputer
    .PARAMETER Body
        This object contains key-value pairs, where the key is the field’s id, and the value is the value of this field.
        This model must contain every mandatory field with a value. Note: do not add a name or type_id key as they are handled seperately in the parameters name and TemplateId, respectively.

        Example:
        $body = @{
            serialnumber = '123'
            type_id = 'Id Of the template that you want to use'
            name = 'Server01'
        }

        	.PARAMETER Confirm
		If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.

	.PARAMETER WhatIf
		If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.

    .EXAMPLE
        PS C:\> New-TdAsset -TemplateId $templateId -Name 'TestComputer' -body @{Type = 'Computer'}
        Creates a new asset named TestComputer. It also sets the asset type to 'Computer'

    #>
    [CmdletBinding( SupportsShouldProcess = $true,
        HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/New-TdAsset')]
    param (
        [Parameter(ValueFromPipelineByPropertyName)]
        [Alias('Id')]
        [system.string]$TemplateId,

        [pscustomobject]$Body,

        #TODO determine if I should make this mandatory. I believe it can be, but I need to spend more time in Assetmgmt to decide further
        [System.string]$Name
    )

    begin {
        $uri = (get-tdurl) + '/tas/api/assetmgmt/assets'
    }

    process {

        # create a body if one wasn't provided.
        if (-not $body) {
            $body = [PSCustomObject]@{}
        }

        # Go through parameters and add them to our body
        switch ($PSBoundParameters.Keys) {
            TemplateId {
                $body | Add-Member -MemberType NoteProperty -Name 'type_id' -Value $TemplateId
            }
            Name {
                $body | Add-Member -MemberType NoteProperty -Name 'name' -Value $Name
            }
        }


        $params = @{
            'Uri'    = $uri
            'Body'   = $Body | ConvertTo-Json
            'Method' = 'Post'
        }
        if ($PSCmdlet.ShouldProcess("Send body --- $($body | convertto-json)" , "to $uri")) {
            Invoke-TdMethod @params
        }
    }
}



