if (-not (Get-Command az -ErrorAction SilentlyContinue)) {
    Write-Host "The Azure CLI (az) is not installed, but it's required to continue. Please install it and then re-run this script." -ForegroundColor Red
    Write-Host "You can download and install the Azure CLI from: https://learn.microsoft.com/en-us/cli/azure/install-azure-cli" -ForegroundColor Yellow
    exit
}

try {
    az account show 2>&1 > $null
    if ($LASTEXITCODE -ne 0) {
        throw
    }
}
catch {
    Write-Host "You are not logged into Azure CLI. Please run 'az login' to log in and then re-run this script." -ForegroundColor Red
    exit
}

#Create Azure Resources
$resourceGroupName = Read-Host "Resource Group Name"
$functionAppName = Read-Host "Resource Name (must be unique to Azure globally)"
$storageAccountName = Read-Host "Storage Account Name (must be lowercase alphanumeric and unique to Azure globally)"

if ((az group exists --name $resourceGroupName) -eq $false) {
    az group create --name $resourceGroupName --location "East US"
}

if(-not (az functionapp show --name $functionAppName --resource-group $resourceGroupName --query "name" --output tsv 2>$null))
{
    az deployment group create --resource-group $resourceGroupName --template-file ./.automations/deployAzureResources.bicep --parameters functionAppName=$functionAppName storageAccountName=$storageAccountName
}

#Build the .Net Project
$csprojFile = Get-ChildItem -Path .\ -Filter *.csproj | Select-Object -First 1
if (-not $csprojFile) {
    Write-Host "No .csproj file found in the current directory." -ForegroundColor Red
    exit
}
dotnet build $csprojFile.Name --configuration Release


# Deploy Code
Compress-Archive -Path .\bin\Release\net6.0\* -DestinationPath .\$csprojFile.Name.zip
az functionapp deployment source config-zip -g $resourceGroupName -n $functionAppName --src .\$csprojFile.Name.zip
Remove-Item -Path .\$csprojFile.Name.zip
