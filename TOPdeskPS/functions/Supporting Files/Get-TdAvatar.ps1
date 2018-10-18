function Get-TdAvatar {
    <#
.SYNOPSIS
    Obtains the image used as an avatar
.DESCRIPTION
    Gets the image used as an avatar by person id
.EXAMPLE
    PS C:\> Get-TdPerson | Get-TdAvatar
    returns all avatars
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdAvatar')]

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

        $uri = (Get-TdUrl) + "/tas/api/persons/id/$PersonId/avatar"
        Invoke-TdMethod -Uri $uri
    }
    end {
        Write-PSFMessage "Function Complete" -level verbose
    }
}

