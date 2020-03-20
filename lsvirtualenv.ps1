# List virtual environment install on this computer
$workon_home = $env:WORKON_HOME

if ([string]::IsNullOrEmpty($workon_home)) {
	Write-Host '$env:WORKON_HOME is not exist.'
	exit -1
}

Write-Host "Available envs:"
$dirs = Get-ChildItem $workon_home
foreach ($dir in $dirs) {
	$env_name = $dir.Name
	$exe_path = [IO.Path]::Combine($workon_home, $env_name, 'Scripts\Activate.ps1')
	if ([System.IO.File]::Exists($exe_path)) {
		Write-Host "==> $env_name" -ForegroundColor DarkGreen
	}
}
