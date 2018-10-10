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
        This model must contain every mandatory field with a value.

        Example:
        {
          "numberField": "string",
         "textField": "string",
        "dropdownField": "string"
        }
    .EXAMPLE
        PS C:\> New-TdAsset -TemplateId $templateId -Name 'TestComputer' -body @{Type = 'Computer'}
        Creates a new asset named TestComputer. It also sets the asset type to 'Computer'

    #>
    [CmdletBinding( SupportsShouldProcess = $true,
        HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/New-TdAsset')]
    param (
        #TODO add support for pipeline
        [Parameter(Mandatory = $true)]
        [system.string]$TemplateId,

        [pscustomobject]$Body
    )

    begin {
        $uri = (get-tdurl) + '/tas/api/assetmgmt/assets'
    }

    process {
        if (-not $body) {
            $body = [PSCustomObject]@{}
        }
        switch ($PSBoundParameters.Keys) {
            TemplateId {
                $body | Add-Member -MemberType NoteProperty -Name 'type_id' -Value $TemplateId
            }
        }
        Write-PSFMessage "$($body | ConvertTo-Json | Out-String)" -Level debug
        $params = @{
            'Uri'    = $uri
            'Body'   = $body
            'Method' = 'Post'
        }
        if ($PSCmdlet.ShouldProcess("Create" , "Creating New Asset with TemplateId $TemplateId")) {
            Invoke-TdMethod @params
        }

    }

    end {
    }
}



