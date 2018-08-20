function Get-TdOperator {
<#
	.SYNOPSIS
		Get TOPdesk operators
	
	.DESCRIPTION
		Gets operators from TOPdesk. You can specify filters to only return one.
	
	.PARAMETER TOPdeskLoginName
		The TOPdesk login name of the operator that you want.
	
	.PARAMETER PageSize
		The amount of operators to be returned per request. Default is 100.
	
	.PARAMETER Start
		The offset at which to start listing the operators at. Useful if you have more than 100 operators.
	
	.EXAMPLE
		PS C:\> Get-TdOperator
		Returns a list of TOPdesk operators, up to 100.
	
	.EXAMPLE
		PS C:\> Get-TdOperator -TOPdeskLoginName 'user@company.net'
		Returns the operator information for the operator with a login name of 'user@company.net' This field may not necessarily be an email address. This depends on how your TOPdesk instance is setup.
	
	.NOTES
		Additional information about the function.
#>
	
	[CmdletBinding(DefaultParameterSetName = 'List',
				   HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/TOPdeskPS/Get-TdOperator')]
	param
	(
		[Alias('LoginName')]
		[string]
		$TOPdeskLoginName,
		
		[Parameter(ParameterSetName = 'List')]
		[ValidateRange(1, 100)]
		[int]
		$PageSize = 100,
		
		[Parameter(ParameterSetName = 'List')]
		[int]
		$Start
	)
	
	begin {
		Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
		$OperatorURL = (Get-TdUrl) + '/tas/api/operators'
	}
	process {
		Write-PSFMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level Debug
		Write-PSFMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -Level Debug
		
		$Uri = "$OperatorURL/?start=$Start&page_size=$PageSize"
		if ($TOPdeskLoginName) {
			$Uri = $Uri + "&topdesk_login_name=$TOPdeskLoginName"
		}
		$Params = @{
			'Uri' = $Uri
		}
		$Operator = Invoke-TdMethod @Params
		$Operator
	}
	end {
		
	}
}