function Get-TdChange {
    <#
	.SYNOPSIS
		Gets changes
	.DESCRIPTION
		This command returns changes. This returns changes available to the account used with Connect-TdService.
	.EXAMPLE
		PS C:\> Get-TdChange
		Grabs changes
#>

    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdChange')]
    param
    (
    )

    begin {
        Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
        $Uri = (Get-TdUrl) + '/tas/api/operatorChangeActivities'
        Write-PSFMessage -Level InternalComment -Message "Uri - $Uri"
    }
    process {
        Write-PSFMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level Debug
        Write-PSFMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -Level Debug
        $params = @{
            'uri' = $uri
        }
        $res = Invoke-TdMethod @params

        foreach ($incident in $res.results) {
            $incident
        }
        #TODO add some filtering so we only return relevant results. May
    }
    end {
    }
}