function Get-TdSubcategory {
    <#
	.SYNOPSIS
		Get subcategories from TOPdesk

	.DESCRIPTION
		Gets either one subcategory or a list of subcategories from TOPdesk.

    .PARAMETER Name
        Name of the subcategory that you want returned. Wildcards are supported. Default value is '*'

	.EXAMPLE
		PS C:\> Get-TdSubcategory
		Gets a list of all subcategories

	.EXAMPLE
		PS C:\> Get-TdSubcategory -Name 'Applications'
		Gets the Subcategory with the name 'Applications'

#>

    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/TOPdeskPS/Get-TdSubcategory')]
    param
    (
        [String]
        $Name = '*'
    )
    $SubcategoryURL = (Get-TdUrl) + '/tas/api/incidents/subcategories'
    $Subcategories = Invoke-TdMethod $SubcategoryURL
    $Subcategories | Where-Object name -like $name
}
