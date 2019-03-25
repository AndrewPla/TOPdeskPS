function Get-TdLoggedInPerson {
    <#
    .DESCRIPTION
        Get Logged in person
    .EXAMPLE
        Get-TdLoggedInPerson
        returns the logged in person.
    #>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/TOPdeskPS/Get-TdLoggedInPerson')]
    param()
    $url = "$(Get-TdUrl)/tas/api/persons/current"
    Invoke-TdMethod -Uri $url
}
