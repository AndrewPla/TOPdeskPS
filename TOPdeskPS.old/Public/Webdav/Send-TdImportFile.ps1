[CmdletBinding()]
param ()

function Send-TdImportFile {
    <#
.SYNOPSIS
    Short description
.DESCRIPTION
    Send-TdImportFile Function
.EXAMPLE
    PS C:\> <example usage>
    Explanation of what the example does
.INPUTS
    Inputs (if any)
.OUTPUTS
    Output (if any)
.NOTES
    Created on:   	6/30/2018 10:01 PM
    Edited on:      6/30/2018
    Created by:   	AndrewPla
    Organization: 	 
    Filename:     	Send-TdImportFile.ps1

#>
	[CmdletBinding(
				   ConfirmImpact = 'Medium',
				   #HelpUri = 'https://topdeskps.readthedocs.io/en/latest/Module/Send-TdImportFile',
				   SupportsShouldProcess = $true
				   )]
	[OutputType()]
	param
	(
		
		[ValidateScript({
				if (-Not ($_ | Test-Path)) {
					throw "File or folder does not exist"
				}
				if (-Not ($_ | Test-Path -PathType Leaf)) {
					throw "The Path argument must be a file. Folder paths are not allowed."
				}
				return $true
			})]
		[System.IO.FileInfo]
		$File,
		
		[Parameter(Mandatory = $true)]
		[PSCredential]
		$Credential
		
	)
	begin {
		Write-Verbose "[$($MyInvocation.MyCommand.Name)] Function started"
		$FileName = Get-Item -Path $File | Select-Object -ExpandProperty Name
		
		$ImportDirectory = "$(Get-TdConfigServer -erroraction stop)/webdav/import"
		$UploadUrl = "$ImportDirectory/$FileName"
	}
	process {
		Write-DebugMessage "[$($MyInvocation.MyCommand.Name)] ParameterSetName: $($PsCmdlet.ParameterSetName)"
		Write-DebugMessage "[$($MyInvocation.MyCommand.Name)] PSBoundParameters: $($PSBoundParameters | Out-String)"
		
		if (-not $PSCmdlet.ShouldProcess("Item")) {
			return
		}
		
		try {
			Write-Verbose 'Uploading File...'
			$params = @{
				Uri		    = $UploadUrl
				Method	    = 'Put'
				InFile	    = $File
				Credential  = $Credential
				ContentType = 'application/x-www-form-urlencoded'
			}
			Invoke-WebRequest @params
		}
		catch {
			Write-Verbose "An error happened, the upload was unsuccessful."
			
			switch ($_.Exception.Response.StatusCode.Value__) {
				401 {
					Write-Error "Invalid Credentials."
				}
				403 {
					Write-Error "Unable to upload to TOPdesk. Make sure that you have write permissions on $ImportDirectory directory."
				}
				409 {
					Write-Error "Unknown directory on remote. Make sure that $ImportDirectory directory exists."
				}
				500 {
					Write-Error "Unknown server error."
				}
			}
			
			return
		}
		end {
			Write-Verbose "[$($MyInvocation.MyCommand.Name)] Complete"
		}
	}
}
