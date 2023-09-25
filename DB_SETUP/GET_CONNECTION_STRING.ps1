$databaseName="tailwind"
$containerName="products"

# Get the connection string
Write-Host "Getting connection string. This might take up to two minutes as we prepare the database..."

$accountName=az cosmosdb list --query "[0].name" -o tsv
$groupName=az group list --query "[0].name" -o tsv

Write-Host "Account Name: $accountName"
Write-Host "Group Name  : $groupName"

# Create the database
az cosmosdb sql database create -a $accountName -g $groupName -n $databaseName -o none

# Add products data
az cosmosdb sql container create -g $groupName -a $accountName -d $databaseName -n $containerName -p /brand/name -o none

$endpoint="https://$accountName.documents.azure.com:443"
$key=az cosmosdb keys list -g $groupName -n $accountName --type keys --query "primaryMasterKey" -o json

## silent npm install
npm install 

Write-Host "Populate Database"
node ./POPULATE_DATABASE.js --endpoint $endpoint --key $key --databaseName $databaseName --containerName $containerName

Write-Host "This is your connection string. Copy it to your clipboard..."
az cosmosdb keys list -n $accountName -g $groupName --type connection-strings --query "connectionStrings[0].connectionString" -o tsv


