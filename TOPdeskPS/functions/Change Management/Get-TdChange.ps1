function Get-TdChange {
    <#
	.SYNOPSIS
		Gets changes
	.DESCRIPTION
        Returns a list of changes. Specify your change using the Change parameter
    .PARAMETER Change
        Id or number of the change to modify
	.EXAMPLE
		PS C:\> Get-TdChange -Change 'C1810-1234'
		Get the change information
#>

    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdChange')]
    param
    (
        [system.string]$Change
    )

    begin {
        Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
        $Uri = (Get-TdUrl) + '/tas/api/operatorChanges'
        Write-PSFMessage -Level InternalComment -Message "Uri - $Uri"
    }
    process {
        Write-PSFMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level Debug
        Write-PSFMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -Level Debug
        $uri = $uri + "/$Change"
        $params = @{
            'uri' = $uri
            Method = 'Get'
        }
        $res = Invoke-TdMethod @params
        $res
    }
    end {
    }
}