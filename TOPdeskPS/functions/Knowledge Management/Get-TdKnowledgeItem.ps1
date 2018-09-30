function Get-TdKnowledgeItem {
    <#
    .SYNOPSIS
        Gets knowledge items
    .DESCRIPTION
        Gets Knowledge Items available to users in the self service portal.
     .PARAMETER Number
        Knowledge item identifier, e.g. ‘KI 0001’

    .EXAMPLE
        PS C:\> Get-TdCountry
        Gets list of all Countries

    #>
    [CmdletBinding()]
    param (
        [system.string]
        $Term
    )
    Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
    $uri = (Get-TdUrl) + '/tas/api/knowledgeBase/public'
    Write-PSFMessage -Level InternalComment -Message "knowledgeBase url: $uri"
 
    $body = [PSCustomObject]@{}
    #TODO get this working! may need to reach out to TOPdesk.
    $body | Add-Member -MemberType NoteProperty -Name query -Value "{  knowledgeItems(search: {term: `"$Term`"})}"
    
    
       	$Params = @{
            'Uri'    = $uri
            'Body'   = $Body
            'Method' = 'Post'
        }
        Invoke-TdMethod @Params
 
}