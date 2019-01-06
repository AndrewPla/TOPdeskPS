function Get-TdPersonAvatar {
    <#
.SYNOPSIS
    Returns the avatar of a person
.DESCRIPTION
Returns the avatar of a person by the persons id.
.PARAMETER PersonId
    Gets the image used as an avatar by person id
.EXAMPLE
    PS C:\> Get-TdPerson | Get-TdPersonAvatar
    returns all avatars
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdPersonAvatar')]

    param
    (
        [Parameter(
            mandatory = $true,
            ParameterSetName = 'PersonId',
            ValueFromPipelineByPropertyName
        )]
        [Alias('Id')]
        $PersonId
    )
    begin {
        Write-PsfMessage "[$($MyInvocation.MyCommand.Name)] Function started" -level verbose
    }

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level internalcomment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -level internalcomment

        $uri = "$(Get-TdUrl)/tas/api/persons/id/$PersonId/avatar"
        $res = Invoke-TdMethod -Uri $uri
        $res
    }
    end {
        Write-PSFMessage "Function Complete" -level verbose
    }
}

