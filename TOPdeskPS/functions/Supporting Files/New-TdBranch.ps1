#TODO Update help
function New-TdBranch {
    <#
.SYNOPSIS
    Creates a new branch
.DESCRIPTION
    creates a new branch
    .PARAMETER Name
Name of the branch
        Specification
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
    ID of head branchj
.EXAMPLE
    PS C:\> New-TdBranch
    creates a new branch
    .NOTES
        See https://developers.topdesk.com/explorer/?page=supporting-files?/
#>
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
                $Body | Add-Member -MemberType NoteProperty -Name 'headBranch' -Value $HeadBranchId
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

