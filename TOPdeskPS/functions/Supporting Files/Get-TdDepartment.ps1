function Get-TdDepartment {
    <#
.SYNOPSIS
    returns list of departments
.DESCRIPTION
    returns list of departments
.EXAMPLE
    PS C:\> Get-TdDepartment
    returns list of departments
#>
[CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdDepartment')]

    param
    (

    )
    begin {
        Write-PsfMessage "[$($MyInvocation.MyCommand.Name)] Function started" -level verbose
        }

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level internalcomment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -level internalcomment

        $uri = (Get-TdUrl) + "/tas/api/departments"
        $res = Invoke-TdMethod -Uri $uri
        $res
    }
    end {
        Write-PSFMessage "Function Complete" -level verbose
    }
}

