function Send-TdWebDAVFile {
    <#
	.SYNOPSIS
		Sends a file to your TOPdesk webdav share

	.DESCRIPTION
		adds a file to your TOPdesk/webdav/Import folder. This can be useful for you to upload files that are imported regularly in your environment.
		Common uses could be to regularly upload your users from a csv, or you could upload asset information that is imported.

	.PARAMETER File
		This is the path of the file that you want to upload to TOPdesk.

	.PARAMETER Credential
		Credential of the user with webdav permissions. This Credential is handled seperately from normal web requests as this doesn't interact with the normal API.

	.PARAMETER Folder
		Name of the TOPdesk webDAV folder that you want to upload a file into
		Valid Values:
		accesslogs
		csvexport
		database_backup
		import
		photos
		topsis
		upload
		web

	.PARAMETER Url
		This is the url to your TOPdesk instance. If you used Connect-TdService -Register then you don't need to specify one.

	.EXAMPLE
		PS C:\> Send-TdWebDAVFile -Credential (Get-Credential) -File 'C:\Users.csv' -Folder upload
		Uploads the C:\Users.csv file to TOPdesk using the credential specified in -Credential.

	.NOTES
		See Help About_TOPdesk_files for more
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/TOPdeskPS/Send-TdWebDAVFile')]
    param
    (
        [ValidateScript( {
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
        $Credential,

        [Parameter(Mandatory = $true)]
        [ValidateSet('accesslogs', 'csvexport', 'database_backup', 'import', 'photos', 'photos/items', 'photos/locations', 'photos/objects', 'photos/operators', 'photos/others', 'photos/persons', 'photos/sites', 'topsis', 'upload', 'web')]
        [string]
        $Folder,

        [Alias('TOPdeskUrl')]
       	[PSFValidatePattern('http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?', ErrorMessage = '{0} is not a valid TOPdesk Url.')]
        [System.String]
        $Url = (Get-PSFConfigValue -FullName TOPdeskPS.Url -NotNull -ErrorAction Continue)
    )

    begin {
$Folder
        Write-PSFMessage "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param' -Level InternalComment
    }

    process {
        Write-PSFMessage "Processing $File" -Level Verbose
        $FileName = Get-Item -Path $File | Select-Object -ExpandProperty Name
        $UploadUrl = "$Url/webdav/$Folder/$FileName"


        Write-PSFMessage "UploadUrl: $UploadUrl" -Level InternalComment
        try {
            Write-PSFMessage 'Uploading File...' -Level Verbose
            $Params = @{
                Uri         = $UploadUrl
                Method      = 'Put'
                InFile      = $File
                Credential  = $Credential
                ContentType = 'application/octet-stream'
            }
            Invoke-WebRequest @Params | Out-Null
        }
        catch {
            switch ($_.Exception.Response.StatusCode.Value__) {
                401 {
                    Write-PSFMessage "Invalid Credentials." -Level Warning -ErrorRecord $_ -OverrideExceptionMessage -EnableException $EnableException.tobool()
                }
                403 {
                    Write-PSFMessage "Unable to upload to TOPdesk. Make sure that you have write permissions on $UploadUrl directory." -Level Warning -ErrorRecord $_ -OverrideExceptionMessage -EnableException $EnableException.tobool()
                }
                409 {
                    Write-PSFMessage "Unknown directory on remote. Make sure that $UploadUrl directory exists." -Level Warning -ErrorRecord $_ -OverrideExceptionMessage -EnableException $EnableException.tobool()
                }
                500 {
                    Write-PSFMessage "Unknown server error." -Level Warning -ErrorRecord $_ -OverrideExceptionMessage -EnableException $EnableException.tobool()
                }
            }
        }
    }
}
