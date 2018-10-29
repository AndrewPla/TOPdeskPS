function Get-TdSupplier {
    <#
.SYNOPSIS
    returns list of suppliers
.DESCRIPTION
    returns list of suppliers
.PARAMETER Name
    Name of the supplier that you want returned. Wildcards are supported. Default value is '*'
.EXAMPLE
    PS C:\> Get-TdSuppliers
    returns list of suppliers
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdSupplier')]

    param (
        [system.string]$Name = '*'
    )
    begin {
        Write-PsfMessage "[$($MyInvocation.MyCommand.Name)] Function started" -level verbose
    }

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level internalcomment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -level internalcomment

        $uri = (Get-TdUrl) + "/tas/api/suppliers"
        $res = Invoke-TdMethod -Uri $uri
        $res  | Where-Object groupname -like $Name
    }
    end {
        Write-PSFMessage "Function Complete" -level verbose
    }
}

