Write-Host "Pre-build started..."
$startTime = Get-Date

cd ./Frontend

$appsettingsFilePath = ".\Appsettings.ts"

$appsettingsFileContent = Get-Content -Path $appsettingsFilePath
$appsettingsFileContent = $appsettingsFileContent -replace '"built"\s*:\s*false', '"built": true'
Set-Content -Path $appsettingsFilePath -Value $appsettingsFileContent

npm i | Out-Null
npm run build | Out-Null

$appsettingsFileContent = $appsettingsFileContent -replace '"built"\s*:\s*true', '"built": false'
Set-Content -Path $appsettingsFilePath -Value $appsettingsFileContent

cd ../

$endTime = Get-Date
$timeDif = ($endTime - $startTime)
$timeTaken = '{0:D2}.{1:D3}' -f $timeDif.Seconds, $timeDif.Milliseconds
"Pre-build completed in $($timeTaken) seconds."