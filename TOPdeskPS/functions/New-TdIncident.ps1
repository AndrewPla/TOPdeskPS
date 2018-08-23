function New-TdIncident {
<#
	.SYNOPSIS
		Creates a new incident
	
	.DESCRIPTION
		This command creates a new incident in TOPdesk
	
	.PARAMETER Action
		Initial action.
		The following html tags can be used to format the text:
		
		<i>
		<em>
		<b>
		<strong>
		<u>
		<a>
		<img> BASE64-encoding has to be used. Only pictures up to the size of 450x450 pixels are supported. Allowed picture-formats:
		gif, png, bmp, pcx, iff, ras, pnm, psd, jpg
		Example:
		<img src="data:image/png;base64,iVBORw0KGgoAAA...">
		
		Line breaks can be added via <br> tags and are automatically added after a closing <p> or <div>.
		Can be set by operators and persons.
	
	.PARAMETER BriefDescription
		Brief description for the incident. This can be set by operators.
		For partials, if not provided, will be automatically copied from the main incident.
		Can be set by persons only when the appropriate setting for the new call form is checked.
	
	.PARAMETER CallerEmail
		This is the email of the incident's caller. TOPdesk will fill the caller's details into the incident automatically.
	
	.PARAMETER Status
		Status of the incident. Available values:
		FirstLine
		SecondLine
		Partial
	
	.PARAMETER Request
		The initial request for the incident. You will likely want to use a here-string to construct the request of the incident.
		
		Line breaks can be added via <br> tags and are automatically added after a closing <p> or
		The following html tags can be used to format the text:
		
		<i>
		<em>
		<b>
		<strong>
		<u>
		<a>
		<img> BASE64-encoding has to be used. Only pictures up to the size of 450x450 pixels are supported. Allowed picture-formats:
		gif, png, bmp, pcx, iff, ras, pnm, psd, jpg
	
	.PARAMETER Category
		The name of the category for the incident. Can be set by operators. If not provided to partial incidents, the category will be automatically copied from the main incident.
	
	.PARAMETER Subcategory
		The name of the category for the incident. Can be set by operators.
		If a subcategory is provided without a category, the corresponding category will be filledi n automatically, unless there are multiple matching categories, in which case the request will fail.
		If not provided to partial incidents, the category will be automatically copied from the main incident.
	
	.PARAMETER Confirm
		If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.
	
	.PARAMETER WhatIf
		If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.
	
	.EXAMPLE
		PS C:\> New-TdIncident -CallerEmail 'user@Company.net' -Action 'Initial Action' -BriefDescription 'Example Incident' -Request 'Printer Assistance'
		This creates a basic incident for the Caller 'user@Company.net'
#>
	
	[CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/TOPdeskPS/New-TdIncident',
				   SupportsShouldProcess = $true)]
	param
	(
		[string]
		$Action,
		
		[ValidateCount(0, 80)]
		[string]
		$BriefDescription,
		
		[Parameter(Mandatory = $true,
				   HelpMessage = 'Email of the caller for the incident')]
		[PSFValidatePattern('\w+([-+.'''''''']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*', ErrorMessage = '{0} is not a valid email address.')]
		[string]
		$CallerEmail,
		
		[ValidateSet('FirstLine', 'SecondLine', 'Partial')]
		[string]
		$Status = 'FirstLine',
		
		[string]
		$Request,
		
		[PsfValidateSet(TabCompletion = 'TdCategory')]
		[string]
		$Category,
		
		
		[string]
		$Subcategory
	)
	
	begin {
		$IncidentURL = (Get-TdUrl) + '/tas/api/incidents'
		Write-PSFMessage -Level internalcomment -Message "IncidentURL: $IncidentURL"
		Write-PSFMessage -Level verbose -Message 'Generating Authorization Header'
	}
	
	process {
		Write-PSFMessage -Level InternalComment -Message "[$($MyInvocation.MyCommand.Name)] ParameterSetName: $($PsCmdlet.ParameterSetName)"
		Write-PSFMessage -Level InternalComment -Message "[$($MyInvocation.MyCommand.Name)] PSBoundParameters: $($PSBoundParameters | Out-String)"
		
		if (-not (Test-PSFShouldProcess -PSCmdlet $PSCmdlet -Target $CallerEmail -Action "Creating incident for $CallerEmail.")) {
			return
		}
		
		Write-PSFMessage -Level Verbose -Message "Generating Body of request"
		$Body = [PSCustomObject]@{
		}
		
		switch ($PSBoundParameters.Keys) {
			Action {
				Write-PSFMessage -Level InternalComment -Message "Adding action to Body"
				$Body | Add-Member -MemberType NoteProperty -Name 'action' -Value $Action
			}
			BriefDescription {
				Write-PSFMessage -Level InternalComment -Message "Adding BriefDescription to Body"
				$Body | Add-Member -MemberType NoteProperty -Name 'briefDescription' -Value $BriefDescription
			}
			Status {
				Write-PSFMessage -Level InternalComment -Message "Adding Status to Body"
				$Body | Add-Member -MemberType NoteProperty -Name 'status' -Value $Status
			}
			Request {
				Write-PSFMessage -Level InternalComment -Message "Adding Request to Body"
				$Body | Add-Member -MemberType NoteProperty -Name 'request' -Value $Request
				
			}
			CallerEmail {
				Write-PSFMessage -Level InternalComment -Message "Adding CallerEmail to Body"
				
				$CallerLookup = @{
					'email' = $CallerEmail
				}
				$Body | Add-Member -MemberType NoteProperty -Name 'callerLookup' -Value $CallerLookup
			}
			Subcategory {
				Write-PSFMessage -Level InternalComment -Message "Adding Subcategory to Body"
				$SubcategoryValue = @{
					name = $Subcategory
				}
				$Body | Add-Member -MemberType NoteProperty -Name 'subcategory' -Value $SubcategoryValue
			}
			Category {
				Write-PSFMessage -Level InternalComment -Message "Adding category to Body"
				$CategoryValue = @{
					name = $Category
				}
				$Body | Add-Member -MemberType NoteProperty -Name 'category' -Value $CategoryValue
			}
			default {
				Write-PSFMessage -Level InternalComment -Message "This is a beautiful body!"
			}
		}
		
		$Params = @{
			'Uri'    = $IncidentURL
			'Body'   = $Body
			'Method' = 'Post'
		}
		
		Invoke-TdMethod @Params
	}
	
	end {
		
	}
}