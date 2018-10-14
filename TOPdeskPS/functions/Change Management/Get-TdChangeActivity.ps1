function Get-TdChangeActivity {
    <#
	.SYNOPSIS
		Gets change activities
	.DESCRIPTION
        This command returns change activitites. This returns changes available to the account used with Connect-TdService.
    .PARAMETER Change
        Id or number of the parent change
        This is a repeatable filter parameter
    .PARAMETER Archived
		Whether to only retrieve archived changes or not.
	.EXAMPLE
		PS C:\> Get-TdChangeActivity -Change 'C1801-123'
		Grabs change activitites for C1801-123
#>

    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdChangeActivity')]
    param
    (
        [Parameter(ParameterSetName = 'query')]
        [system.string[]]$Change,

        [Parameter(ParameterSetName = 'query')]
        [switch]
        $Archived
    )

    begin {
        Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
        $Uri = (Get-TdUrl) + '/tas/api/operatorChangeActivities'
        Write-PSFMessage -Level InternalComment -Message "Uri - $Uri"
    }
    process {
        Write-PSFMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level Debug
        Write-PSFMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -Level Debug


        if ($PSCmdlet.ParameterSetName -match 'Query') {
            #TODO make this look nicer
            $uri = $uri + '/?'
            foreach ($chan in $change) {
                $uri = $uri + "change=$chan&"
            }
            if ($PSBoundParameters.keys -contains 'Archive') {
                $uri = $uri + "archive=$Archive&"
            }

        }


        $params = @{
            'uri' = $uri
        }
        $res = Invoke-TdMethod @params

        foreach ($incident in $res.results) {
            $incident
        }
    }
    end {
    }
}
