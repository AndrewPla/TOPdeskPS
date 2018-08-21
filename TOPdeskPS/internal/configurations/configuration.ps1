$params = @{
	
	Module	    = 'TOPdeskPS';
	Name	    = 'url';
	Value	    = $null;
	Initialize  = $true;
	Validation  = 'string'
	Description = 'This is the address of your TOPdesk instance. EX: Company.TopDesk.net '
}
Set-PSFConfig @params

$params = @{
	
	Module	    = 'TOPdeskPS';
	Name	    = 'TdCategory';
	Value	    = $null;
	Initialize  = $true;
	Validation  = 'string'
	Description = 'These are the categories from your TOPdesk environment'
}
Set-PSFConfig @params