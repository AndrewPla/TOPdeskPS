function Set-TdBranch {
    <#
.SYNOPSIS
    update a branch by id
.DESCRIPTION
    update branch
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
    Hashtable containing address values
    .PARAMETER PostalAddress
    Hashtable containing postal address values
.EXAMPLE
    PS C:\> Set-TdBranch -BranchId (Get-TdBranch -Name 'Test Branch').id -Phone '555-555-5555'
    Updates the Test Branch phone number.
#>


    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Set-TdBranch',
        SupportsShouldProcess = $true)]
    param
    (
        [Parameter(
            mandatory = $true,
            ParameterSetName = 'BranchId',
            ValueFromPipelineByPropertyName
        )]
        [Alias('Id')]
        $BranchId,

        [System.String]$Name,

        [system.string]$Specification,

        [System.String]$ClientReferenceNumber,

        [System.String]$Phone,

        [System.String]$fax,

        [System.String]$Email,

        [System.String]$Website,


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

        $uri = (Get-TdUrl) + "/tas/api/branches/id/$BranchId"
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
                $body | Add-Member -Membertype NoteProperty -Name 'fax' -Value $Fax
            }
            Email {
                $body | Add-Member -Membertype NoteProperty -Name 'email' -Value $Email
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
        Invoke-TdMethod -Uri $uri -Body ($body | Convertto-json) -Method 'PUT'
    }
    end {
        Write-PSFMessage "Function Complete" -level verbose
    }

}

