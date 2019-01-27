# Add all things you want to run after importing the main code

# Reminder: $dc is the directory separating character for X-Plat compatibility

# Load Configurations
foreach ($file in (Get-ChildItem "$ModuleRoot$($dc)internal$($dc)configurations$($dc)*.ps1" -ErrorAction Ignore)) {
    . Import-ModuleFile -Path $file.FullName
}

# Load Tab Expansion
foreach ($file in (Get-ChildItem "$ModuleRoot$($dc)internal$($dc)tepp$($dc)*.tepp.ps1" -ErrorAction Ignore)) {
    . Import-ModuleFile -Path $file.FullName
}

# Load Tab Expansion Assignment
. Import-ModuleFile -Path "$ModuleRoot$($dc)internal$($dc)tepp$($dc)assignment.ps1"

# Load License
. Import-ModuleFile -Path "$ModuleRoot$($dc)internal$($dc)scripts$($dc)license.ps1"
