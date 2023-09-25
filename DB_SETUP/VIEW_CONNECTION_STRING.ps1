$databaseName="tailwind"
$containerName="products"

# Get the connection string
Write-Host "Getting connection string. This might take up to two minutes as we prepare the database..."

$accountName=az cosmosdb list --query "[0].name" -o tsv
$groupName=az group list --query "[0].name" -o tsv

Write-Host "Account Name: $accountName"
Write-Host "Group Name  : $groupName"

$endpoint="https://$accountName.documents.azure.com:443"
$key=az cosmosdb keys list -g $groupName -n $accountName --type keys --query "primaryMasterKey" -o json

Write-Host "Connection string:"
az cosmosdb keys list -n $accountName -g $groupName --type connection-strings --query "connectionStrings[0].connectionString" -o tsv


