# Make virtual env using python
param($env, $Python)

if ([string]::IsNullOrEmpty($env)) {
	Write-Host "env name is needed."
	exit -1
}

if ([string]::IsNullOrEmpty($Python)) {
	$Python = "python"
}

$workon_home = $env:WORKON_HOME

# Check if the Environment Variable
# WORKON_HOME is existed.
if ([string]::IsNullOrEmpty($workon_home)) {
	Write-Host '$env:WORKON_HOME is not exist.' -ForegroundColor DarkRed
	exit -1
}

$cwd = (Get-Location).Path # Get current working directory

cd $workon_home
$dirs = Get-ChildItem $workon_home
foreach ($dir in $dirs) {
	$env_name = $dir.Name
	if ($env_name -eq $env) {
		Write-Host "$env is already exist in $workon_home." -ForegroundColor DarkRed
		exit -1
	}
}
. $Python -m venv $env

cd $cwd
