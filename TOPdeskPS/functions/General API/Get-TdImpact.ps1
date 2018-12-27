function Get-TdImpact {
    <#
    .SYNOPSIS
        Gets list of impacts
    .DESCRIPTION
        Gets list of impacts
    .PARAMETER Name
        Name of the impact that you want returned. Wildcards are supported. Default value is '*'

    .EXAMPLE
        PS C:\> Get-TdImpact
        Gets list of impacts

        .EXAMPLE
        PS> Get-TdImpact -name person
        Returns the 'person' impact
    #>
    [CmdletBinding( HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdImpact')]
    param (
        $Name = '*'
    )
    $uri = (Get-TdUrl) + '/tas/api/incidents/impacts'
    $Params = @{
        'uri' = $uri
    }
    $res = Invoke-TdMethod @Params
    $res | Where-Object name -like $Name
}
