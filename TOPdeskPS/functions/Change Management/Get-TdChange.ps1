function Get-TdChange {
    <#
	.SYNOPSIS
		Gets changes

	.DESCRIPTION
		This command returns changes. You can select a change by it's Id, or just view all changes available to you.
    .PARAMETER Name
        Name of the subcategory that you want returned. Wildcards are supported. Default value is '*'

	.EXAMPLE
		PS C:\> Get-TdChange
		Grabs a list of 10 incidents
#>

    [CmdletBinding()]
    param
    (
        [System.String]$Id
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