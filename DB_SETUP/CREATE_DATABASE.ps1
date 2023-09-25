$rnd="tutorial"
$accountName="tailwind-traders-$rnd"
$databaseName="tailwind"
$containerName="products"

Write-Host "Beginning database creation process..."

$groupName=az group list --query "[0].name" -o tsv

Write-Host "Creating Cosmos DB database $accountName in Resource Group $groupName..."
Write-Host "This can take up to 10 minutes. Feel free to continue with the Learn Module."
Write-Host "az cosmosdb create -n $accountName -g $groupName -o none"
            az cosmosdb create -n $accountName -g $groupName -o none