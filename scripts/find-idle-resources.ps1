param(
    [Parameter(Mandatory)]
    [string]$SubscriptionId
)

$ErrorActionPreference = "Stop"

az account set --subscription $SubscriptionId

Write-Host "Unattached managed disks"
az disk list --query "[?managedBy==null].{name:name, resourceGroup:resourceGroup, size:diskSizeGb, sku:sku.name}" -o table

Write-Host "Idle public IP addresses"
az network public-ip list --query "[?ipConfiguration==null].{name:name, resourceGroup:resourceGroup, location:location, sku:sku.name}" -o table

Write-Host "Resources missing cost tags"
az graph query -q "Resources | where isnull(tags.costCenter) or isnull(tags.owner) | project name, type, resourceGroup, location, tags" -o table

