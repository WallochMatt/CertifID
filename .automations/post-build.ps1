param(
	[string] $OutDir
)
Write-Host "Post-build started..."
$startTime = Get-Date

if($env:BUILD_ARTIFACTSTAGINGDIRECTORY -ne $null){
	$OutDir = $env:BUILD_ARTIFACTSTAGINGDIRECTORY + "\"
	$OutDir = $OutDir -replace '..\', '.\'
}

$frontendFolder = $OutDir + "Frontend"

cd ./Frontend

New-Item -ItemType Directory -Path $frontendFolder -Force | Out-Null
Copy-Item -Path ".\dist\*" -Destination $frontendFolder -Recurse -Force

cd ../

$endTime = Get-Date
$timeDif = ($endTime - $startTime)
$timeTaken = '{0:D2}.{1:D3}' -f $timeDif.Seconds, $timeDif.Milliseconds
"Post-build completed in $($timeTaken) seconds."