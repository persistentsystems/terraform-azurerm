# Creates a CosmosDB container

Creates a "Table" in a SQL database in cosmosDB.

## Resources Created
[azurerm_cosmosdb_sql_container](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_sql_container)

## Inputs
- context - This is the output of the resource-group module.  Which provides azure location and resource group to provision infrastructure in.
- service_settings
  - account_name - The Cosmos DB account to create the database in.
  - database_name- The Cosmos DB SQL database to create the container in.
  - name - the name of the contianer (table)
  - partition_key_path - what to use as a partition key.

## Outputs
None

## Example Usage: 
See folder samples/scenarios/03-cosmosdb

```hcl

module "cosmosdb_northwind_customers" {
  
  source = "../../../submodules/terraform-azurerm/services/cosmos-db/container/v1"

  context = module.coreinfra.context
  
  service_settings = {
    
    account_name       = module.cosmosdb_account.name
    database_name      = module.cosmosdb_database.name
    name               = "customers"
    partition_key_path = "/customerid"
  }
}
```