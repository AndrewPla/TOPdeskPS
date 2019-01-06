function Get-TdCategory {
    <#
	.SYNOPSIS
		Get categories from TOPdesk

	.DESCRIPTION
		Gets either one category or a list of categories from TOPdesk.

	.PARAMETER Name
		This is the name of the category that you want. Wildcards are supported.

	.EXAMPLE
		PS C:\> Get-TdCategory
		Gets a list of all categories

	.EXAMPLE
		PS C:\> Get-TdCategory -Name 'End User Support'
		Gets the category with the name 'End User Support'
#>

    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/TOPdeskPS/Get-TdCategory')]
    param
    (
        [String]
        $Name = '*'
    )

    process {
        $CategoryURL = (Get-TdUrl) + '/tas/api/incidents/categories'

        $Params = @{
            'uri' = $CategoryUrl
        }
        $Categories = Invoke-TdMethod @Params
        $categories | Where-Object name -like $name | Select-PSFObject -Typename 'TOPdeskPS.BasicObj' -KeepInputObject
    }

}
