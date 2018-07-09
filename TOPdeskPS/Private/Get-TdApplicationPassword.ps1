function Get-TdApplicationPassword {
    [CmdletBinding()]
    param (
    )
    $path = "$env:appdata\TOPdeskPS\Creds\"

    #ToDo think about allowing $path to be a parameter and using the config system to set the path.

        $credFile = Get-ChildItem "$path\*.cred"
        if ($credFile.count -gt 1) {
            throw "more than 1 cred found. remove the one that you dont want to use from $path."
        }
                      
    
        $cred = Import-Clixml $credFile 
        Write-Output $cred
    
    
}
