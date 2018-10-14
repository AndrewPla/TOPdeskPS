function New-TdChange {
    <#
    .SYNOPSIS
        Create a new Request for Change
    .DESCRIPTION
        Create new change request. Can also use a change template to help fill out the change.
        Also triggers Events and Actions. Note! Actions that require user interaction like “Confirm before sending” or “Editable before sending” will not be executed.
    .PARAMETER RequesterId
        Id of the requester of the change.
    .PARAMETER BriefDescription
        Brief description of a created change. example: Smartphone broken
    .PARAMETER ChangeType
        Specify the type of change. Options: Simple, Extensive
    .PARAMETER Request
            The request of the change
            example: Dean reported that his smartphone is broken. We need to order new ones.
    .PARAMETER Action
        The action of the change. example: I ordered 5 new smartphones.
    .PARAMETER TemplateId
        Id of the template that you want. if both TemplateId and TemplateNumber are set, then only the id weill be taken into account.
    .PARAMETER ExternalNumber
        External number of the change. example: 12345
    .PARAMETER Category
    UUID or name of the category. example: Software
    .PARAMETER SubCategory
        UUID or name of the subcategory. It must match with the provided category or the category of the template
    .PARAMETER Benefit
        UUID or name of the benefit. example: Cost Savings
    .PARAMETER Impact
        UUID or name of the impact. example: Branch
    .PARAMETER Priority
        UUID or name of the priority. example: Low
    .PARAMETER Confirm
		If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.

	.PARAMETER WhatIf
		If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.

    .EXAMPLE
        PS C:\> <example usage>
        Explanation of what the example does
    #>
    [CmdletBinding( SupportsShouldProcess = $true,
        HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/New-TdChange')]
    param (
        [Parameter(Mandatory)]
        [system.string]
        $RequesterId,

        [Parameter(Mandatory)]
        [system.string]
        $BriefDescription,

        [Parameter(Mandatory)]
        [ValidateSet('Simple', 'Extensive')]
        [system.string]
        $ChangeType,

        [system.string]
        $Request,

        [system.string]
        $Action,

        [system.string]
        $TemplateId,

        [system.string]
        $ExternalNumber ,

        [system.string]
        $Category,

        [system.string]
        $SubCategory,

        [system.string]
        $Benefit,

        [system.string]
        $Impact,

        [system.string]
        $Priority
        #TODO add optional activities

        #TODO add phases

    )

    begin {
        $uri = (get-tdurl) + '/tas/api/operatorChanges'
    }

    process {

        $body = [PSCustomObject]@{}
        switch ($PSBoundParameters.Keys) {
            BriefDescription {
                Write-PSFMessage -Level InternalComment -Message "Adding briefDescription to Body"
                $body | Add-Member -MemberType NoteProperty -Name 'briefDescription' -Value $BriefDescription
            }

            ChangeType {
                Write-PSFMessage -Level InternalComment -Message "Adding ChangeType to Body"
                $body | Add-Member -MemberType NoteProperty -Name 'changeType' -Value $ChangeType.ToLower()
            }
            RequesterId {
                $requesterIdObject = @{
                    id = $RequesterId
                }
                Write-PSFMessage -Level InternalComment -Message "Adding requesterId to Body"
                $body | Add-Member -MemberType NoteProperty -Name 'requester' -Value $requesterIdObject
            }
            Request {
                Write-PSFMessage -Level InternalComment -Message "Adding request to Body"
                $body | Add-Member -MemberType NoteProperty -Name 'request' -Value $Request
            }

            action {
                Write-PSFMessage -Level InternalComment -Message "Adding action to Body"
                $body | Add-Member -MemberType NoteProperty -Name 'action' -Value $action
            }
            TemplateId {
                $templateIdObject = @{
                    id = $TemplateId
                }
                Write-PSFMessage -Level InternalComment -Message "Adding templateId to Body"
                $body | Add-Member -MemberType NoteProperty -Name 'template' -Value $templateIdObject
            }
            externalNumber {
                Write-PSFMessage -Level InternalComment -Message "Adding externalNumber to Body"
                $body | Add-Member -MemberType NoteProperty -Name 'externalNumber' -Value $externalNumber
            }
            category {
                Write-PSFMessage -Level InternalComment -Message "Adding category to Body"
                $body | Add-Member -MemberType NoteProperty -Name 'category' -Value $category
            }
            subcategory {
                Write-PSFMessage -Level InternalComment -Message "Adding subcategory to Body"
                $body | Add-Member -MemberType NoteProperty -Name 'subcategory' -Value $subcategory
            }
            benfit {
                Write-PSFMessage -Level InternalComment -Message "Adding benfit to Body"
                $body | Add-Member -MemberType NoteProperty -Name 'benfit' -Value $benfit
            }
            impact {
                Write-PSFMessage -Level InternalComment -Message "Adding impact to Body"
                $body | Add-Member -MemberType NoteProperty -Name 'impact' -Value $impact
            }
            priority {
                Write-PSFMessage -Level InternalComment -Message "Adding priority to Body"
                $body | Add-Member -MemberType NoteProperty -Name 'priority' -Value $priority
            }
        }
        Write-PSFMessage "$($body | ConvertTo-Json | Out-String)" -Level debug
        $params = @{
            'Uri'    = $uri
            'Body'   = $body | ConvertTo-Json
            'Method' = 'Post'
        }
        if ($PSCmdlet.ShouldProcess("Request" , "Sending change request $BriefDescription")) {
            Invoke-TdMethod @params
        }

    }

    end {
    }
}