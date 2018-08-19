[CmdletBinding()]
param()

function Invoke-TdMethod {
    <#
.SYNOPSIS
    Short description
.DESCRIPTION
    Invoke-TdMethod Function
.EXAMPLE
    PS C:\> <example usage>
    Explanation of what the example does
.INPUTS
    Inputs (if any)
.OUTPUTS
    Output (if any)
.NOTES
    Created on:   	6/25/2018 1:08 PM
    Edited on:      6/25/2018
    Created by:   	AndrewPla
    Organization: 	 
    Filename:     	Invoke-TdMethod.ps1

#>  #requires -version 3
    [CmdletBinding(
        ConfirmImpact = 'Low',
        #HelpUri = 'https://topdeskps.readthedocs.io/en/latest/Module/Invoke-TdMethod',
        SupportsShouldProcess = $true
    )]
    param
    (
        [Parameter( Mandatory )]
        [Uri]
        $URI,

        [Microsoft.PowerShell.Commands.WebRequestMethod]
        $Method = "GET",

        [String]
        $Body,

        [Switch]
        $RawBody,

        [Hashtable]
        $Headers = @{},

        [String]
        $InFile,

        [String]
        $OutFile,

        [Switch]
        $StoreSession,

        [PSCredential]
        $Credential,

        [ValidateNotNullOrEmpty()]
        [System.Management.Automation.PSCmdlet]
        $Cmdlet = $PSCmdlet
    )
    begin {
        Write-Verbose "[$($MyInvocation.MyCommand.Name)] Function started"

        $_headers = @{   # Set any default headers
            "Accept"         = "application/json"
            "Accept-Charset" = "utf-8"
        }
        foreach ($item in $Headers.Key) { $_headers[$item] = $Headers[$item] }
    }
    process {
        Write-Verbose "[$($MyInvocation.MyCommand.Name)] ParameterSetName: $($PsCmdlet.ParameterSetName)"
        Write-Verbose "[$($MyInvocation.MyCommand.Name)] PSBoundParameters: $($PSBoundParameters | Out-String)"

        if (-not $PSCmdlet.ShouldProcess("Item")) {
            return
        }

        $PSDefaultParameterValues = $global:PSDefaultParameterValues

        $splatParameters = @{
            Uri             = $Uri
            Method          = $Method
            Headers         = $_headers
            ContentType     = "application/json; charset=utf-8"
            UseBasicParsing = $true
            Credential      = $Credential
            ErrorAction     = "Stop"
            Verbose         = $false
        }

        if ($_headers.ContainsKey("Content-Type")) {
            $splatParameters["ContentType"] = $_headers["Content-Type"]
            $_headers.Remove("Content-Type")
            $splatParameters["Headers"] = $_headers
        }

        if ($Body) {
            if ($RawBody) {
                $splatParameters["Body"] = $Body
            }
            else {
                # Encode Body to preserve special chars
                # http://stackoverflow.com/questions/15290185/invoke-webrequest-issue-with-special-characters-in-json
                $splatParameters["Body"] = [System.Text.Encoding]::UTF8.GetBytes($Body)
            }
        }

        if ($StoreSession) {
            $splatParameters["SessionVariable"] = "newSessionVar"
            $splatParameters.Remove("WebSession")
        }

        if ($session = Get-TdSession -ErrorAction SilentlyContinue) {
            if (-not ($Credential)) {
                $splatParameters["WebSession"] = $session.WebSession
                $splatParameters.Remove("Credential")
            }
        }

        if ($InFile) {
            $splatParameters["InFile"] = $InFile
        }
        if ($OutFile) {
            $splatParameters["OutFile"] = $OutFile
        }

        # Invoke the API
        Write-Verbose "[$($MyInvocation.MyCommand.Name)] $($splatParameters.Method) $($splatParameters.Uri)"
        Write-Debug "[$($MyInvocation.MyCommand.Name)] Invoke-WebRequest with `$splatParameters: $($splatParameters | Out-String)"
        try {
            $webResponse = Invoke-WebRequest @splatParameters
        }
        catch {
            Write-Verbose "[$($MyInvocation.MyCommand.Name)] Failed to get an answer from the server"
            # Invoke-WebRequest is hard-coded to throw an exception if the Web request returns a 4xx or 5xx error.
            # This is the best workaround I can find to retrieve the actual results of the request.
            $webResponse = $_
            if ($webResponse.ErrorDetails) {
                # In PowerShellCore (v6+), the response body is available as string
                $responseBody = $webResponse.ErrorDetails.Message
            }
            else {
                $webResponse = $webResponse.Exception.Response
            }
        }

        Write-Debug "[$($MyInvocation.MyCommand.Name)] Executed WebRequest. Access `$webResponse to see details"

        if ($webResponse) {
            # In PowerShellCore (v6+) the StatusCode of an exception is somewhere else
            if (-not ($statusCode = $webResponse.StatusCode)) {
                $statusCode = $webresponse.Exception.Response.StatusCode
            }
            Write-Verbose "[$($MyInvocation.MyCommand.Name)] Status code: $($statusCode)"

            if ($statusCode.value__ -ge 400) {
                Write-Warning "Jira returned HTTP error $($statusCode.value__) - $($statusCode)"

                if ((!($responseBody)) -and ($webResponse | Get-Member -Name "GetResponseStream")) {
                    # Retrieve body of HTTP response - this contains more useful information about exactly why the error occurred
                    $readStream = New-Object -TypeName System.IO.StreamReader -ArgumentList ($webResponse.GetResponseStream())
                    $responseBody = $readStream.ReadToEnd()
                    $readStream.Close()

                    # Clear the body in case it is not a JSON (but rather html)
                    if ($responseBody -match "^[\s\t]*\<html\>") { $responseBody = '{"errorMessages": "Invalid server response. HTML returned."}' }

                    Write-Verbose "[$($MyInvocation.MyCommand.Name)] Retrieved body of HTTP response for more information about the error (`$responseBody)"
                    Write-Debug "[$($MyInvocation.MyCommand.Name)] Got the following error as `$responseBody"
                    $result = ConvertFrom-Json -InputObject $responseBody
                }

            }
            else {
                if ($StoreSession) {
                    return ConvertTo-JiraSession -Session $newSessionVar -Username $Credential.UserName
                }

                if ($webResponse.Content) {
                    $result = ConvertFrom-Json -InputObject $webResponse.Content
                }
                else {
                    # No content, although statusCode < 400
                    # This could be wanted behavior of the API
                    Write-Verbose "[$($MyInvocation.MyCommand.Name)] No content was returned from."
                }
            }
        }
        else {
            Write-Verbose "[$($MyInvocation.MyCommand.Name)] No Web result object was returned from. This is unusual!"
        }

        if ($result) {
            if (Get-Member -Name "Errors" -InputObject $result -ErrorAction SilentlyContinue) {
                Resolve-JiraError $result -WriteError -Cmdlet $Cmdlet
            }
            else {
                Write-Output $result
            }
        }


    }
    end {
        Write-Verbose "[$($MyInvocation.MyCommand.Name)] Complete"
    }
}

