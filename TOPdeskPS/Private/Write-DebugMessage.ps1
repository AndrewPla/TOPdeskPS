[CmdletBinding()]
param()

function Write-DebugMessage {
    <#
.SYNOPSIS
    Short description
.DESCRIPTION
    Write-DebugMessage Function
.EXAMPLE
    PS C:\> <example usage>
    Explanation of what the example does
.INPUTS
    Inputs (if any)
.OUTPUTS
    Output (if any)
.NOTES
    Created on:   	6/26/2018 9:35 AM
    Edited on:      6/26/2018
    Created by:   	AndrewPla
    Organization: 	 
    Filename:     	Write-DebugMessage.ps1

#>
    [CmdletBinding()]
    param(
        [Parameter( ValueFromPipeline )]
        [String]
        $Message
    )

    begin {
        $oldDebugPreference = $DebugPreference
        if (-not ($DebugPreference -eq "SilentlyContinue")) {
            $DebugPreference = 'Continue'
        }
    }

    process {
        Write-Debug $Message
    }

    end {
        $DebugPreference = $oldDebugPreference
    }
}


