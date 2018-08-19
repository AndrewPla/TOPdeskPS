function Send-TdImportFile {
<#
	.SYNOPSIS
		Sends a file to your TOPdesk webdav import file
	
	.DESCRIPTION
		adds a file to your TOPdesk/webdav/Import folder. This can be useful for you to upload files that are imported regularly in your environment.
		Common uses could be to regularly upload your users from a csv, or you could upload asset information that is imported.
	
	.PARAMETER File
		This is the path of the file that you want to upload to TOPdesk.
	
	.PARAMETER Credential
		Credential of the user with webdav permissions. This Credential is handled seperately from normal web requests as this doesn't interact with the normal API.
	
	.EXAMPLE
				PS C:\> Send-TdImportFile -Credential (Get-Credential) -File 'C:\Users.csv'
				Uploads the C:\Users.csv file to TOPdesk using the credential specified in -Credential.
	
	.NOTES
		See About_TOPdesk_files for more
#>
	
	[CmdletBinding()]
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
		Write-PSFMessage "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param' -Level InternalComment
		
		$FileName = Get-Item -Path $File | Select-Object -ExpandProperty Name
		
		$UploadUrl = (Get-TdUrl -ErrorAction Stop) + '/webdav/import' + "/$FileName"
		Write-PSFMessage "UploadUrl: $UploadUrl" -Level InternalComment
	}
	process {
		
		try {
			Write-PSFMessage 'Uploading File...' -Level Verbose
			$Params = @{
				Uri		    = $UploadUrl
				Method	    = 'Put'
				InFile	    = $File
				Credential  = $Credential
				ContentType = 'application/x-www-form-urlencoded'
			}
			Invoke-WebRequest @Params
		}
		catch {
			
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
		}
		
	}
	end {
	}
}