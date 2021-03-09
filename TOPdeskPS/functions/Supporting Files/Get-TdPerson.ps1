function Get-TdPerson {
    <#
    .SYNOPSIS
        Gets persons
    .DESCRIPTION
        Gets persons

    .PARAMETER ResultSize
    The amount of operators to be returned. Requests greater than 100 require multiple api calls. Useful if you want to return all operators

    .PARAMETER Start
		This is the offset at which you want to start listing incidents. This is useful if you want to grab more than 100 incidents.
		The default value is 0.
    .PARAMETER Archived
        Whether to retrieve archived
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
     Retrieve only per sons with mobile number ending with this. Spaces and dashes are ignored. For example: 6-12345678 will match both +316 12345678 and 06 1234 5678
    .EXAMPLE
        PS C:\> Get-TdPerson -FirstName 'Bob' -Archived
            Returns all persons with the firstname starting with Bob. This will also search archived files.
    .EXAMPLE
        PS C:\> Get-TdPerson -Email 'User@company.com' | Format-List *
            Returns the person whose email is 'user@company.com' and displays all details of the result.

    #>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdPerson')]
    param (
        [system.string]$FirstName,

        [system.string]$Email,

        [Alias('Surname')]
        [system.string]$LastName,

        [system.string]$NetworkLoginName,

        [System.String]$SspLoginName,

        [system.string]$MobileNumber,

        [switch]$Archived,

        [ValidateRange(1, 100000)]
        [int]
        $ResultSize = 100,

        [int]$Start = 0
    )
    Write-Verbose "Bound parameters: $($PSBoundParameters.Keys -join ", ")"
    $uri = (Get-TdUrl) + '/tas/api/persons?'

    if ($PSBoundParameters.keys -contains 'FirstName') {
        $uri = "$uri&firstname=$FirstName"
    }

    if ($PSBoundParameters.keys -contains 'lastname') {
        $uri = "$uri&lastname=$LastName"
    }

    if ($PSBoundParameters.keys -contains 'NetworkLoginName') {
        $uri = "$uri&network_login_name=$NetworkLoginName"
    }

    if ($PSBoundParameters.keys -contains 'SspLoginName') {
        $uri = "$uri&ssp_login_name=$SspLoginName"
    }

    if ($PSBoundParameters.keys -contains 'email') {
        $uri = "$uri&email=$email"
        Write-Verbose "email added - $uri"
    }

    if ($PSBoundParameters.keys -contains 'MobileNumber') {
        $uri = "$uri&mobile_number=$MobileNumber"
    }

    if ($PSBoundParameters.keys -contains 'Archived') {
        $uri = "$uri&archived=true"
    }

    Write-Verbose $uri

    #region Send Multiple requests to until the resultsize is met

    #define pagesize outside the loop so we can set the pagesize

    if ($ResultSize -gt 100) {
        $pageSize = 100
    }
    else {
        $pageSize = $ResultSize
    }

    $uri = $uri.replace('?&', '?')
    $count = 0

    $status = 'not finished'

    do {

        $persons = @()

        $remaining = $ResultSize - $count

        if ($remaining -le 100) { $status = 'finished'; $pagesize = $remaining }

        $loopingUri = "$uri&start=$Start&page_size=$pageSize"
        $Params = @{
            'uri' = $loopingUri
        }

        $persons = Invoke-TdMethod @Params

        foreach ($p in $persons) {
            if ($p.id) { $p | Select-PSFObject -Typename 'TOPdeskPS.Person' -KeepInputObject }

            # end the loop if the api doesn't return a person id.
            else { $status = 'finished' }
        }

        $count += $persons.count
        $start += $PageSize

    }
    until ($status -like 'finished')
}
