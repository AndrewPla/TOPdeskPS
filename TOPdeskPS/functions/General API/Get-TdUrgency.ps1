function Get-TdUrgency {
    <#
    .SYNOPSIS
        Gets list of all urgencies
    .DESCRIPTION
        Gets list of all urgencies
    .PARAMETER Name
        Name of the urgency that you want returned. Wildcards are supported. Default value is '*'

    .EXAMPLE
        PS C:\> Get-TdUrgency
        Gets list of all urgencies

    .EXAMPLE
        PS> Get-TdUrgency -name 'Able to work'
        Returns the requested urgency

    #>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdUrgency')]
    [OutputType([TOPdeskPS.BasicObj])]
    param (
        [parameter (position = 0)]
        [string]
        $Name = '*'
    )
    $uri = (Get-TdUrl) + '/tas/api/incidents/urgencies'
    $res = Invoke-TdMethod $uri
    $res | Where-Object name -like $Name | Select-PSFObject -Typename 'TOPdeskPS.BasicObj' -KeepInputObject
}
