function Get-TdIncidentAction {
    <#
    .SYNOPSIS
       Gets actions from an incident
    .DESCRIPTION
        Returns all actions for an incident.
    .PARAMETER Number
        This is the incident number.
	.PARAMETER PageSize
		The amount of actions to be returned per request. The default value is 10 and the maximum value is 100.
	
	.PARAMETER Start
		This is the offset at which you want to start listing actions. This is useful if you want to grab more than 100.
		The default value is 0.

    .EXAMPLE
        PS C:\> Get-TdIncidentAction -Number 'i123-1234'
        Grabs all actions from incident with number 'i123-1234
        
    #>
    [CmdletBinding()]
    param (
        [Parameter(
          
        )]
        [string]
        $Number,

        [ValidateRange(1, 100)]
        [int]
        $PageSize = 10,
		
        [int]
        $Start = 0
    )
    
    begin {
        Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'

    }
    
    process {
        Write-PSFMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level Debug
        Write-PSFMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -Level Debug
        foreach ($num in $Number) {
            $incidentActionURL = (Get-TdUrl) + "/tas/api/incidents/number/$num/actions"
            Write-PSFMessage -Level debug -Message "IncidentActionUrl: $incidentActionUrl"
            $uri = "$incidentActionUrl/?start=$Start&page_size=$PageSize"
            $Params = @{
                'uri' = $uri
            }
            $actions = Invoke-TdMethod @Params
            $actions
        }
    }
    
    end {
    }
}