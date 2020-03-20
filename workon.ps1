# Workon a virtual environment
param($env)

$workon_home = $env:WORKON_HOME

# Check if the Environment Variable
# WORKON_HOME is existed.
if ([string]::IsNullOrEmpty($workon_home)) {
	Write-Host '$env:WORKON_HOME is not exist.' -ForegroundColor DarkRed
	exit -1
}

$exe_path = [IO.Path]::Combine($workon_home, $env, 'Scripts\Activate.ps1')

if (-not [System.IO.File]::Exists($exe_path)) {
	Write-Host "$exe_path is not exist." -ForegroundColor DarkRed
	Write-Host "=============================="
	Write-Host "Available envs:"
	Write-Host "------------------------------"
	
	$dirs = Get-ChildItem $workon_home
	foreach ($dir in $dirs) {
		$env_name = $dir.Name
		$exe_path = [IO.Path]::Combine($workon_home, $env_name, 'Scripts\Activate.ps1')
		if ([System.IO.File]::Exists($exe_path)) {
			Write-Host "==> $env_name" -ForegroundColor DarkGreen
		}
	}
	exit -1
}

. $exe_path	# Execute the Activate.ps1 script

Write-Host "workon $env."
Write-Host "Type 'deactivate' to exit the env."
