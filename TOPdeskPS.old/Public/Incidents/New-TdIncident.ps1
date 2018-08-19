function New-TdIncident {
    [CmdletBinding()]
    param (
    
        [Parameter(Mandatory = $true)]
        [string]
        $Request,

        [Parameter(Mandatory = $true)]
        [string]
        $Action,
        
        [Parameter(Mandatory = $true)]
        [string]
        $CallerLookup
        
    )
    
    begin {
		$TOPdeskUrl = Get-TdConfigServer -ErrorAction stop
		$IncidentURL = $TOPdeskUrl + '/tas/api/incidents'
		
		Write-Verbose 'Generating Authorization Header'
		$headers = @{ 'Authorization' = $Script:__LoginToken }
    }
    
    process {
		Write-DebugMessage "[$($MyInvocation.MyCommand.Name)] ParameterSetName: $($PsCmdlet.ParameterSetName)"
		Write-DebugMessage "[$($MyInvocation.MyCommand.Name)] PSBoundParameters: $($PSBoundParameters | Out-String)"
		
		if (-not $PSCmdlet.ShouldProcess("Item")) {
			return
		}
		
        $params = @{
            "request" = "$request";
            "action"  = "$action";
            "caller" = "$caller"
        }
        $uri = "$topdeskurl/tas/api/incidents"
        $Params = @{
            'Headers' = $headers
            'uri'     = $uri
            'body' = $params
            'method' = 'post'
        }
        Write-Verbose "URI: $uri"
        Invoke-TdRequest @Params
    }
    
    end {

    }
}