function Invoke-TDRequest {
    <#
	.SYNOPSIS
		A brief description of the Invoke-TDRequest function.
	
	.DESCRIPTION
		A detailed description of the Invoke-TDRequest function.
	
	.PARAMETER Company
		A description of the Company parameter.
	
	.PARAMETER Username
		A description of the Username parameter.
	
	.PARAMETER AppKey
		A description of the AppKey parameter.
	
	.PARAMETER Module
		The name of the topdesk module taht you would like to interface with
	
	.EXAMPLE
				PS C:\> Invoke-TDRequest -Username 'Value2' -AppKey 'Value3'
#>
	
    [CmdletBinding()]
    param
    (
        $Uri,
		
        $Method = 'Get',
		
        [hashtable]
        $Headers,
		
        $Body
    )
	
    begin {
        #region Setup Parameters to splat
        $Params = @{
            'URI'     = $Uri
            'Headers' = $Headers
            'Method'  = $Method
        }
        if ($Body) {
            $Params.Add('Body', ($Body| ConvertTo-Json))
        }
        #endregion Setup Parameters to splat
		
    }
    process {
        Invoke-RestMethod @Params
    }
    end {
		
    }
}
