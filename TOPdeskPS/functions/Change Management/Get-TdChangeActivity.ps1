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
    .EXAMPLE
		PS C:\> Get-TdChangeActivity -Change (Get-TdChange -Name *laptop*).id
		Returns Change Activities for all Changes with laptop anywhere in their name.
#>

    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdChangeActivity')]
    param
    (
        [Parameter(ParameterSetName = 'query')]
        [Parameter(ValueFromPipelineByPropertyName)]
        [Alias('id')]
        [string[]]$Change,

        [Parameter(ParameterSetName = 'query')]
        [switch]
        $Archived

    )

    begin {
        Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
    }
    process {
        Write-PSFMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level Debug
        Write-PSFMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -Level Debug

        if ($PSCmdlet.ParameterSetName -match 'Query') {
            $methodParams = @{
                uri = ("$(Get-TdUrl)/tas/api/operatorChangeActivities?")
            }
            foreach ($chan in $change) {
                $methodParams['uri'] = "$($methodParams.uri)&change=$chan"
            }
            if ($PSBoundParameters.keys -contains 'Archive') {
                $methodParams['uri'] = "$($methodParams.uri)&archive=$($Archive.tostring().tolower())"
            }
        }
        else {
            $methodParams = @{
                uri = ("$(Get-TdUrl)/tas/api/operatorChangeActivities")
            }
        }
        $res = Invoke-TdMethod @methodParams
        $res.results
    }
    end {
    }
}
