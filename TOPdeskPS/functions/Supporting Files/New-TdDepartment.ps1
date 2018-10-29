function New-TdDepartment {
    <#
.SYNOPSIS
    Creates a new Department
.DESCRIPTION
    Creates a new department
.PARAMETER Name
    Name of new department
.PARAMETER ExternalLinkId
    external link ID
.PARAMETER Confirm
    If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.
.PARAMETER WhatIf
    If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.
.EXAMPLE
    PS C:\> New-TdDepartment -Name 'TestDepartment'
    Creates a new Department named 'TestDepartment'
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/New-TdDepartment',
        SupportsShouldProcess = $true)]
    param
    (
        [Parameter(Mandatory, ParameterSetName = 'Name')]
        [System.string]$Name,
        [Parameter(Mandatory, ParameterSetName = 'ExternalLink')]
        [System.string]$externalLinkId
    )
    begin {
        Write-PsfMessage "[$($MyInvocation.MyCommand.Name)] Function started" -level verbose
    }

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level internalcomment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -level internalcomment

        $uri = (Get-TdUrl) + "/tas/api/departments"
        $body = [PSCustomObject]@{}

        $body | Add-Member -MemberType NoteProperty -Name 'name' -Value $name
        if ($pscmdlet.ParameterSetName -eq 'ExternalLink') {
            $externalLink = [PSCustomObject]@{
                id   = $ExternalLinkId
                type = $ExternalLinkType
            }
            $body | Add-Member -MemberType NoteProperty -Name 'externalLink' -Value $externalLink
        }

        if (-not (Test-PSFShouldProcess -PSCmdlet $PSCmdlet -Target $uri -Action 'Sending Request')) {
            return
        }
        Invoke-TdMethod -Uri $uri -Body ($body | Convertto-json) -Method POST
    }
    end {
        Write-PSFMessage "Function Complete" -level verbose
    }
}

