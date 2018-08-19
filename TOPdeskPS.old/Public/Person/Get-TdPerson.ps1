[CmdletBinding()]
param ()

function Get-TdPerson {
<#
	.SYNOPSIS
		Get a list of TOPdesk persons.
	
	.DESCRIPTION
		This function grabs all of the persons in your TOPdesk environment
	
	.PARAMETER Email
		Retrieve only persons with email starting with this.
	
	.PARAMETER FirstName
		Retrieve only persons with first name starting with this.
	
	.PARAMETER LastName
		Retrieve only persons with last name starting with this.
	
	.PARAMETER PageSize
		A description of the PageSize parameter.
	
	.PARAMETER Start
		A description of the Start parameter.
	
	.PARAMETER LoggedInUsers
		Show logged on persons only.
	
	.PARAMETER Archived
		Whether to return archived persons. Parameter is ignored for SSP users.
	
	.EXAMPLE
		PS C:\> Get-TdPerson
		Returns a full list of persons in your TOPdesk environment.
	
	.EXAMPLE
		PS C:\> Get-TdPerson -LoggedInUsers
		Returns a full list of currently logged in persons in your TOPdesk environment.
	
	.EXAMPLE
		PS C:\> Get-TdPerson -FirstName 'Andrew'
		Returns all persons who have a firstname that starts with Andrew
	
	.EXAMPLE
		PS C:\> Get-TdPerson -LastName 'Smi'
		Returns all persons who have a lastname that starts with 'Smi'
		This would return persons who have a last name of Smith, Smitten, Smitherman, etc.
	
	.OUTPUTS
		TOPdeskPS.Person
	
	.NOTES
		Created on:   	7/8/2018 4:54 PM
		Edited on:      7/8/2018
		Created by:   	AndrewPla
		Organization:
		Filename:     	Get-TdPerson.ps1
	
	.INPUTS
		Inputs (if any)
#>
	
	[CmdletBinding(DefaultParameterSetName = ' List',
				   ConfirmImpact = 'Low',
				   SupportsShouldProcess = $true)]

	param
	(
		[Parameter(Position = 0)]
		[string]
		$Email,
		
		[Parameter(Position = 1)]
		[string]
		$FirstName,
		
		[Parameter(Position = 2)]
		[string]
		$LastName,
		
		[Parameter(Position = 3)]
		[ValidateRange(1, 100)]
		[int]
		$PageSize = 10,
		
		[Parameter(Position = 4)]
		[int]
		$Start = 0,
		
		[Parameter(Position = 5)]
		[switch]
		$LoggedInUsers,
		
		[Parameter(Position = 6)]
		[boolean]
		$Archived = $false
	)
	
	begin {
		
		Write-Verbose "[$($MyInvocation.MyCommand.Name)] Function started"
		
		$TOPdeskUrl = Get-TdConfigServer -ErrorAction stop
		$PersonURL = $TOPdeskUrl + '/tas/api/persons'
		
		Write-Verbose 'Generating Authorization Header'
		$headers = @{
			'Authorization' = $Script:__LoginToken
		}
	}
	process {
		Write-DebugMessage "[$($MyInvocation.MyCommand.Name)] ParameterSetName: $($PsCmdlet.ParameterSetName)"
		Write-DebugMessage "[$($MyInvocation.MyCommand.Name)] PSBoundParameters: $($PSBoundParameters | Out-String)"
		
		if (-not $PSCmdlet.ShouldProcess("Item")) {
			return
		}
		
		$uri = "$PersonURL/?start=$Start&page_size=$PageSize"
		
		if ($PSBoundParameters.keys -contains 'FirstName') {
			Write-Verbose "FirstName = $FirstName"
			$uri = "$uri&firstname=$FirstName"
		}
		
		if ($PSBoundParameters.keys -contains 'LastName') {
			Write-Verbose "LastName = $LastName"
			$uri = "$uri&lastname=$LastName"
		}
		
		if ($PSBoundParameters.keys -contains 'Email') {
			Write-Verbose "Email = $Email"
			$uri = "$uri&email=$Email"
		}
		
		if ($PSBoundParameters.keys -contains 'Archived') {
			Write-Verbose "Archived = $Archived"
			$uri = "$uri&archived=$Archived"
		}
		
		$Params = @{
			'Headers' = $headers
			'uri'	  = $uri
			'Method'  = 'Get'
		}
		
		Write-DebugMessage "RestMethod Params: $($Params | out-string)"
		$people = Invoke-RestMethod @Params
		
		foreach ($person in $people) {
			Write-Verbose "Processing Person : $($person.DynamicName)"
			$Person.psobject.typenames.Insert(0, 'TOPdeskPS.Person')
			$Person
		}
	}
	end {
		Write-Verbose "[$($MyInvocation.MyCommand.Name)] Complete"
	}
}

