$script:PSModuleRoot = $PSScriptRoot

# this is the login token that we define with Connect-TdSeervice
$script:__LoginToken = ''

$FunctionFolders = @('Public', 'Private')

ForEach ($folder in $FunctionFolders) {
    Write-Verbose "Processing $folder"
    $folderPath = Join-Path -Path $PSScriptRoot -ChildPath $folder
    Write-Verbose "FolderPath = $folderPath"
    If (Test-Path -Path $folderPath) {
        Write-Verbose -Message "Importing from $folder"
        $functions = Get-ChildItem -Path $folderPath -Filter '*.ps1' -Recurse
        ForEach ($function in $functions) {
            Write-Verbose -Message "  Importing $($function.fullname)"
            . $function.fullname
        }

    }
    else { Write-Verbose "$Folderpath doesn't exist"}
}

$publicFunctions = (Get-ChildItem -Path "$PSScriptRoot\public" -Filter '*.ps1' -Recurse).BaseName

#ToDo Figure out private function scope
$privateFunctions = (Get-ChildItem -Path "$PSScriptRoot\private" -Filter '*.ps1' -Recurse).BaseName


Export-ModuleMember -Function $publicFunctions

#ToDo Remove line below when ready 
Export-modulemember -function $privateFunctions

