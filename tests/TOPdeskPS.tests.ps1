$moduleRoot = Resolve-Path "$PSScriptRoot\.."
$moduleName = Split-Path $moduleRoot -Leaf

Describe "General project validation: $moduleName" {
	
	$scripts = Get-ChildItem $moduleRoot -Include *.ps1, *.psm1, *.psd1 -Recurse
	
	# TestCases are splatted to the script so we need hashtables
	$testCase = $scripts | Foreach-Object { @{ file = $_ } }
	It "Script <file> should be valid powershell" -TestCases $testCase {
		param ($file)
		
		$file.fullname | Should Exist
		
		$contents = Get-Content -Path $file.fullname -ErrorAction Stop
		$errors = $null
		$null = [System.Management.Automation.PSParser]::Tokenize($contents, [ref]$errors)
		$errors.Count | Should Be 0
	}
	
	It "Module '$moduleName' can import cleanly" {
		{ Import-Module (Join-Path $moduleRoot "$moduleName.psm1") -force } | Should Not Throw
	}
}

Describe 'Convertto-Base64' {
	# Let's import the  function that we are going to be testing
	. $ModuleRoot\Internal\Convertto-Base64.ps1
	
	
	$testCase = @(
		@{
			InputObject	     = '12345687'
		}
		@{
			InputObject	     = 'FOO'
		}
		@{
			InputObject  = 'foo:bar'
		}
	)
	
	It "Converts <inputobject> to Base64" -TestCases $testCase {
		param ($InputObject)
		
		
		# Grab the base64 from 2 strings
		$Base64 = Convertto-Base64 -inputobject $InputObject
		
		# Convert the Base 64 back into a string
		[System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String($Base64)) | Should beoftype System.String
		
	}
}

Describe 'Invoke-TDRequest' {
	# Load function
	. $ModuleRoot\Internal\Invoke-TDRequest.ps1
	
	
	
}

Describe 'Get-TDIncident'{
	
	
	Mock Invoke-TDRequest { return}
	It 
}

# Thanks to Kevin Marquette for the code 
# https://kevinmarquette.github.io/2017-01-21-powershell-module-continious-delivery-pipeline/?utm_source=blog&utm_medium=blog&utm_content=titlelink
