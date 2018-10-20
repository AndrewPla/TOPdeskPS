function Get-TdSupplierContact {
    <#
.SYNOPSIS
    Gets list of supplier  contacts
.DESCRIPTION
    Returns list of supplier contacts
    .PARAMETER Name
    retrieve only suppliers with names starting with this string
    .PARAMETER PageSize
    The amount of suppliers to be returned per request. Must be between 1 and 10000, default is 1000.
    .PARAMETER Archived
        Whether to retrieve archived incidents.
    .PARAMETER PageSize
		The amount of incidents to be returned per request. The default value is 10 and the maximum value is 100.
	.PARAMETER Start
		This is the offset at which you want to start listing suppliers at.
        The default value is 0.
    .PARAMETER SupplierId
    ID of the Supplier. See Get-TdSupplier
    .EXAMPLE
    PS C:\> Get-TdSuppliercontact
    Returns list of supplier contacts
      .EXAMPLE
    PS C:\> Get-TdSupplier | Get-TdSupplierContact
    Returns list of
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdSupplierContact')]

    param
    (
        [Parameter(
            ValueFromPipelineByPropertyName
        )]
        [Alias('Id')]
        $SupplierId,

        [ValidateRange(1, 100)]
        [int]
        $PageSize = 10,

        [int]
        $Start = 0,

        [switch]
        $Archived
    )
    begin {
        Write-PsfMessage "[$($MyInvocation.MyCommand.Name)] Function started" -level verbose
    }

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level internalcomment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -level internalcomment
        $uri = (Get-TdUrl) + "/tas/api/supplierContacts"
        $uri = "$uri/?start=$Start&page_size=$PageSize"
        if ($PSBoundParameters.keys -contains 'Name') {
            $uri = "$uri&name=$Name"
        }

        if ($PSBoundParameters.keys -contains 'Archived') {
            $uri = "$uri&archived=$($Archived.tostring().tolower())"
        }
        $res = Invoke-TdMethod -Uri $uri
        $res
    }
    end {
        Write-PSFMessage "Function Complete" -level verbose
    }
}

