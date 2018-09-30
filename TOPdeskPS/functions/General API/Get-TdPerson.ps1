function Get-TdPerson {
    <#
    .SYNOPSIS
        Gets persons 
    .DESCRIPTION
        Gets persons
    .PARAMETER PageSize
		The amount of incidents to be returned per request. The default value is 10 and the maximum value is 100.
	.PARAMETER Start
		This is the offset at which you want to start listing incidents. This is useful if you want to grab more than 100 incidents.
		The default value is 0.
    .PARAMETER Archived
        Whether to retrieve archived incidents.
    .PARAMETER FirstName 
        Retrieve only persons with first name starting with this
    .PARAMETER LastName 
        Retrieve only persons with last name starting with this
    .PARAMETER NetworkLoginName 
        Retrieve only users with network login nmae starting with this. Parameter is ignored for SSP users.
    .PARAMETER SspLoginName
        Retrieve only persons with Self Service Portal name starting with this. Parameter is ignored for SSP users.
    .PARAMETER Email 
        Retrieve only persons with email starting with this        
    .PARAMETER MobileNumber
     Retrieve only persons with mobile number ending with this. Spaces and dashes are ignored. For example: 6-12345678 will match both +316 12345678 and 06 1234 5678      
    .EXAMPLE
        PS C:\> Get-TdPerson -FirstName 'Bob' -Archived
            Returns all persons with the firstname starting with Bob. This will also search archived files.
    .EXAMPLE
        PS C:\> Get-TdPerson -Email 'User@company.com'
            Returns the person whose email is 'user@company.com'

    #>
    [CmdletBinding()]
    param (
        [system.string]$FirstName,

        [system.string]$Email,

        [Alias('Surname')]
        [system.string]$LastName,

        [system.string]$NetworkLoginName,

        [System.String]$SspLoginName,        

        [system.string]$MobileNumber,

        [switch]$Archived,

        [ValidateRange(1, 100)]
        [int]$PageSize = 10,
		
        [int]$Start = 0
    )
    Write-PSFMessage -Level debug -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
    $uri = (Get-TdUrl) + '/tas/api/persons'
    $uri = "$Uri/?start=$Start&page_size=$PageSize"
    Write-PSFMessage -Message "persongroups url: $uri" -Level debug 
  
    Write-PSFMessage "Creating Uri based on parameters" -Level debug
    if ($PSBoundParameters.keys -contains 'FirstName') {
        $uri = "$uri&firstname=$FirstName"
        Write-PSFMessage "FirstName added - $uri" -Level debug
    }
    
    if ($PSBoundParameters.keys -contains 'lastname') {
        $uri = "$uri&lastname=$LastName"
        Write-PSFMessage "LastName added - $uri" -Level debug
    }

    if ($PSBoundParameters.keys -contains 'NetworkLoginName') {
        $uri = "$uri&network_login_name=$NetworkLoginName"
        Write-PSFMessage "NetworkLoginName added - $uri" -Level debug
    }

    if ($PSBoundParameters.keys -contains 'SspLoginName') {
        $uri = "$uri&ssp_login_name=$SspLoginName"
        Write-PSFMessage "SspLoginName added - $uri" -Level debug
    }

    if ($PSBoundParameters.keys -contains 'email') {
        $uri = "$uri&email=$email"
        Write-PSFMessage "email added - $uri" -Level debug
    }
    
    if ($PSBoundParameters.keys -contains 'MobileNumber') {
        $uri = "$uri&mobile_number=$MobileNumber"
        Write-PSFMessage "MobileNumber added - $uri" -Level debug
    }

    if ($PSBoundParameters.keys -contains 'Archive') {
        $uri = "$uri&archive=$Archive"   
        Write-PSFMessage "Archive added - $uri" -Level debug
    }
  
    $Params = @{
        'uri' = $uri
    }
    $res = Invoke-TdMethod @Params
    $res
}