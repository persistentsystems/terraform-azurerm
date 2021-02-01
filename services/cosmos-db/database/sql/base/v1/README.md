# Creates a SQL database within an CosmosDB Account 

## Resources Created
[azurerm_cosmosdb_sql_database]()

## Inputs 
- context - This is the output of the resource-group module.  Which provides azure location and resource group to provision infrastructure in.
- service_settings 
  - name - the name of the Database
  - account_name - the name of the CosmosDB account
  - max_throughput - The Database is created as Auto-Scaling and this is the max RUs that the Database will scale to.

## Outputs
- name -  currently just an echo of service_settings.name

## Example Usage 
See folder samples/scenarios/03-cosmosdb for an end-to-end demo.

```hcl

module cosmosdb_database {
  source = "../../../submodules/terraform-azurerm/services/cosmos-db/database/sql/base/v1"
  context                   = module.coreinfra.context
  service_settings = {
    name            = "Northwind-Customers"
    account_name    = module.cosmosdb_account.name 
    # for autoscaling resources, shared between all containers
    # the module just does shared autoscaling at this time.
    # We can create more modules in the library as needed.
    max_throughput  = 4000
  }

}

```
