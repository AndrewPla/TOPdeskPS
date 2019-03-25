function Get-TdKnowledgeItem {
    <#
    .SYNOPSIS
        Returns Knowledge Items
    .DESCRIPTION
        Retrieve a list of knowledge items available to users of the Self-Service Portal. This is a GraphQL endpoint, which means the response object is fully determined by a user-provided string that describes:
        - which attributes to retrieve
        - which filters to apply
        This currently only works for person accounts, this will not work for Operator accounts.
     .PARAMETER Term
        This is the search term that you want to filter KIs on.
     .EXAMPLE
        PS C:\> Get-TdKnowledgeItem -Term 'printer'
        Gets list of all priorities

    #>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdKnowledgeItem')]
    param (
        [string]$Term = ' '
    )
    $url = "$(Get-TdUrl)/tas/api/knowledgeBase/public"
    $body = "query { knowledgeItems(search: {term: `"$Term`"}) { id number translations { id languageId knowledgeItemId title description content }}}"
    $params = @{
        'Uri' = $url
        ContentType = 'text/plain'
        'Method' = 'POST'
        Body = $body
    }
    $res = Invoke-TdMethod @params
    $res.results.knowledgeItems
}
