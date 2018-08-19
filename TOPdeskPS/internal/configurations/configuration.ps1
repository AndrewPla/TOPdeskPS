<#
This is an example configuration file

By default, it is enough to have a single one of them,
however if you have enough configuration settings to justify having multiple copies of it,
feel totally free to split them into multiple files.
#>


Set-PSFConfig -Module 'TOPdeskPS' -Name 'url' -Value $null -Initialize -Validation 'string' -Description "This is the address of your TOPdesk instance. EX: Company.TopDesk.net "
 