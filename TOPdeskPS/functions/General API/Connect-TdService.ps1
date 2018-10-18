function Connect-TdService {
    <#
	.SYNOPSIS
		Prepares your session for TOPdeskPS

	.DESCRIPTION
		This command either generates a login token if you provide TOPdesk credentials or this will generate the headers if you are using an application password (use -ApplicationPassword)

	.PARAMETER Credential
		Credentials used to access TOPdesk.

	.PARAMETER UserType
		Specify whether you want to login as a person or an operator. Default value: operator

	.PARAMETER PassThru
		Passes the login token through to the console. Can be useful for troubleshooting or if you want to generate a login token to be consumed by a different application.

	.PARAMETER Url
		This is the Url of your TOPdesk instance. You can specify a custom port. Example: 'https://Company.TOPdesk.net' , 'http://10.1.2.3:90'

	.PARAMETER Register
		Saves your TOPdesk url so you don't need to manually specify it each time. For more information see about_TOPdeskPS_Registration

	.PARAMETER EnableException
        Specify whether you want this command to throw an exception if it encounters an error.

    .PARAMETER ApplicationPassword
        Specify whether you are supplying an application password credential rather than a TOPdesk credential. The credential still needs to be provided to the Credential parameter.

	.EXAMPLE
		PS C:\> Connect-TdService -Url 'https://company.topdesk.net' -Credential (Get-Credential)
		Prompts you for your TOPdesk credentials and then connects to TOPdesk.

	.EXAMPLE
		PS C:\> Connect-TdService -Credential $Cred -Url 'https://company.topdesk.net:90' -Register -ApplicationPassword
        Generates a header that is specific to Application Passwords. The Url will be registered so you don't need to enter it the next time you run connect-tdservice. We will be using port 90.
#>

    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/TOPdeskPS/Connect-TdService')]
    [OutputType([System.String])]
    param
    (

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [PSCredential]
        $Credential,

        [ValidateSet('person', 'operator')]
        $UserType = 'operator',

        [switch]
        $PassThru,

        #[PSFValidatePattern('http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?', ErrorMessage = '{0} is not a valid TOPdesk Url.')]
        [System.String]
        $Url = (
            Get-PSFConfigValue -FullName TOPdeskPS.Url -NotNull -ErrorAction Continue),

        [switch]
        $Register,

        [Switch]
        $ApplicationPassword,

        [switch]
        $EnableException
    )
    Write-PSFMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level Debug
    Write-PSFMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -Level Debug
    $resourceUri = "$url/tas/api/login/$UserType"

    if ($ApplicationPassword) {
        Write-PSFMessage -Level Verbose -Message "Generating Basic header using applicationpassword."
        $Script:__LoginToken = "Basic $(ConvertTo-Base64 "$($Credential.username):$($Credential.GetNetworkCredential().password)")"
    }

    elseif (-not $ApplicationPassword) {
        Write-PSFMessage "Sending login request to TOPdesk to generate token." -Level Verbose
        $headers = @{
            'Authorization' = "Basic $(ConvertTo-Base64 "$($Credential.username):$($Credential.GetNetworkCredential().password)")"
        }
        $params = @{
            URI     = $resourceURi
            Method  = "GET"
            Headers = $headers
        }
        $result = Invoke-RestMethod @params -ErrorAction Stop
        if ($result.item.name -like 'item') {
            Stop-PSFFunction -Message 'invalid url given.' -EnableException $EnableException -Cmdlet $PSCmdlet
            return
        }
        else {
            Write-PSFMessage -Level Verbose -Message 'LoginToken received and set.'
            $Script:__LoginToken = "TOKEN id=`"$result`""
        }
    }
    if ($PassThru) {
        $Script:__LoginToken
    }


    Set-PSFConfig -FullName TOPdeskPS.Url -Value $Url
    if ($Register) {
        Register-PSFConfig -FullName TOPdeskPS.Url
    }

    if (Test-PSFFunctionInterrupt) {
        return
    }
    Write-PSFMessage -Message 'Function Complete' -Level internalcomment

}
