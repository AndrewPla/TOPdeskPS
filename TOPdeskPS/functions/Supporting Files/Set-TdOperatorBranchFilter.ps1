function Set-TdOperatorBranchFilter {
    <#
.SYNOPSIS
    Link and unlink branch filters from an operator
.DESCRIPTION
    Link and unlink branch filters from an operator
.PARAMETER Operator
    Id of the operator that you want to link/unlink filters from
.PARAMETER Link
    Ids of the filters that you want to link to the operator
.PARAMETER Unlink
    Ids of the filters that you want to unlink from the operator
.PARAMETER Confirm
    If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.
.PARAMETER WhatIf
    If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.
.EXAMPLE
    PS C:\> Get-TdOperator -name 'John Smith' | Set-TdOperatorBranchFilter -link (Get-TdBranchFilter -name 'BranchFilter1').id
    Links John Smith to the BranchFilter1 branch filter
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Set-TdOperatorBranchFilter',
        SupportsShouldProcess = $true)]
    param
    (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [Alias('id')]
        $Operator,

        [string[]]
        $Link,

        [string[]]
        $Unlink
    )

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -Level InternalComment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -Level InternalComment

        $uri = "$(Get-TdUrl)/tas/api/operators/id/$Operator/filters/branch"
        $body = [PSCustomObject]@{}

        switch ($PSBoundParameters.keys) {
            Link {
                $body = [PSCustomObject]@{}
                $memberParams = @{ Membertype = 'Noteproperty'; InputObject = $body}

                foreach ($l in $Link) {
                    $memberParams['Name'] = 'id'
                    $memberParams['Value'] = $l
                    Add-Member @memberParams
                }
                $methodParams = @{
                    Uri = $uri
                    Body = ($body | ConvertTo-Json)
                    Method = 'POST'
                }
                if (($body | ConvertTo-Json).count -eq 1) {
                    $methodParams['body'] = "[$($body | Convertto-json)]"
                }

                if (Test-PSFShouldProcess -PSCmdlet $PSCmdlet -Target $uri -Action "Sending Request:$($body | ConvertTo-Json)") {
                    $res = Invoke-TdMethod @methodParams
                    $res
                }

            }
            Unlink {
                $body = [PSCustomObject]@{}
                $memberParams = @{ Membertype = 'Noteproperty'; InputObject = $body}
                foreach ($l in $UnLink) {
                    #$memberParams['inputobject'] = $linkBody
                    $memberParams['Name'] = 'id'
                    $memberParams['Value'] = $l
                    Add-Member @memberParams
                }
                $methodParams = @{
                    Uri = $uri
                    Body = ($body | ConvertTo-Json)
                    Method = 'DELETE'
                }
                if (($body | convertto-json).count -eq 1) {
                    $methodParams['body'] = "[$($body | Convertto-json)]"
                }

                if (Test-PSFShouldProcess -PSCmdlet $PSCmdlet -Target $uri -Action "Sending Request:$($body | ConvertTo-Json)") {
                    $res = Invoke-TdMethod @methodParams
                    $res
                }
            }
        }
    }

}

