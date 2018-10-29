function New-TdBranch {
    <#
.SYNOPSIS
    Creates a new branch
.DESCRIPTION
    creates a new branch
.PARAMETER Name
    Name of the branch
.PARAMETER Specification
    Branch specification
.PARAMETER ClientReferenceNumber
    Client Reference Number
.PARAMETER Phone
    Phone Number
.PARAMETER Fax
    Fax Number
.PARAMETER Email
    email address
.PARAMETER Website
    Website URL
.PARAMETER BranchType
    Define the type of branch. Optional values: 'independentBranch', 'headBranch', 'hasAHeadBranch'
.PARAMETER HeadBranchId
    ID of head branch
.PARAMETER Address
    Address
.PARAMETER OptionalFields1
    optional
.PARAMETER OptionalFields2
    optional
.PARAMETER PostalAddress
    Postal Address
.PARAMETER Confirm
    If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.
.PARAMETER WhatIf
    If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.
.EXAMPLE
    PS C:\> New-TdBranch -Name 'New Branch' -Branch Type 'independentBranch' -Phone '555-555-5555'
    creates a new branch with defined charactaristics
.EXAMPLE
    PS C:\> New-TdBranch -Name 'Subsidiary of AlphaBranch' -BranchType 'hasAHeadBranch' -HeadBranchId (Get-TdBranch -name 'AlphaBranch').id
.LINK
    https://developers.topdesk.com/explorer/?page=supporting-files?/
#>
    #TODO Update help

    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/New-TdBranch',
        SupportsShouldProcess = $true)]
    param
    (
        [Parameter(Mandatory)]
        [System.String]$Name,

        [system.string]$Specification,

        [System.String]$ClientReferenceNumber,

        [System.String]$Phone,

        [System.String]$fax,

        [System.String]$Email,

        [System.String]$Website,

        [Parameter(Mandatory)]
        [ValidateSet('independentBranch', 'headBranch', 'hasAHeadBranch')]
        [System.String]$BranchType,

        [Alias('HeadBranch')]
        $HeadBranchId,
        [hashtable]$Address,
        [hashtable]$PostalAddress,
        [hashtable]$OptionalFields1,
        [hashtable]$OptionalFields2

    )
    begin {
        Write-PsfMessage "[$($MyInvocation.MyCommand.Name)] Function started" -level verbose
    }

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level internalcomment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -level internalcomment

        $uri = (Get-TdUrl) + "/tas/api/branches"
        $body = [PSCustomObject]@{}
        switch ($PSBoundParameters.Keys) {
            Name {
                $Body | Add-Member -MemberType NoteProperty -Name 'name' -Value $Name
            }
            Specification {
                $Body | Add-Member -MemberType NoteProperty -Name 'specification' -Value $Specification
            }
            ClientReferenceNumber {
                $Body | Add-Member -MemberType NoteProperty -Name 'clientReferenceNumber' -Value $ClientReferenceNumber
            }
            Phone {
                $Body | Add-Member -MemberType NoteProperty -Name 'phone' -Value $Phone
            }
            Fax {
                $body | Add-Member -TypeName NoteProperty -Name 'fax' -Value $Fax
            }
            Email {
                $body | Add-Member -TypeName NoteProperty -Name 'email' -Value $Email
            }
            Website {
                $Body | Add-Member -MemberType NoteProperty -Name 'website' -Value $Website
            }
            BranchType {
                $Body | Add-Member -MemberType NoteProperty -Name 'branchType' -Value $BranchType
            }
            HeadBranchId {
                $HeadBranch = @{
                    id = $HeadBranchId
                }
                $Body | Add-Member -MemberType NoteProperty -Name 'headBranch' -Value $HeadBranch
            }
            Address {
                $Body | Add-Member -MemberType NoteProperty -Name 'address' -Value $Address
            }
            PostalAddress {
                $Body | Add-Member -MemberType NoteProperty -Name 'postalAddress' -Value $PostalAddress
            }
            OptionalFields1 {
                $Body | Add-Member -MemberType NoteProperty -Name 'optionalFields1' -Value $OptionalFields1
            }
            OptionalFields2 {
                $Body | Add-Member -MemberType NoteProperty -Name 'optionalFields2' -Value $OptionalFields2
            }

        }



        if (-not (Test-PSFShouldProcess -PSCmdlet $PSCmdlet -Target $uri -Action 'Sending Request')) {
            return
        }
        Invoke-TdMethod -Uri $uri -Body ($body | Convertto-json) -Method 'POST'
    }
    end {
        Write-PSFMessage "Function Complete" -level verbose
    }
}

