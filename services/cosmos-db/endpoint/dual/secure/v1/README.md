# Create a CosmosDB Account (Endpoint)

This creates a cosmosDB account.  It is an Endpoint because it creates and URL that you can interact with.  Is is Secure
because the access keys for the account are stored in KeyVault and you do not need to pass around the access key to 
modules that will use the database.  The access key will be in the state of the project that creates the account, 
but if other terraform uses of the account reference the KeyVault key name instead of directly passing around the
access key, the number of copies of the access key is minimized.

The Access key can be updated in KeyVault which should aid in key rotations.

## Azure Resources Created

[azurerm_cosmosdb_account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_account)


## Inputs

- context - This is the output of the resource-group module.  Which provides azure location and resource group to provision infrastructure in.
- service_settings
  - name - The name of the Database.  It will be suffixed with a random number.
  - tier (offer_type) -  Currently only "Standard" is allowed.
  - kind - [GlobalDocumentDB | MongoDB ]
  - consistency_level - [BoundedStaleness | Eventual | Session | Strong | ConsistentPrefix ]
  - automatic_failover - bool , do you want automatic failover
  - locations - A list of locations to host the database with priority numbers.
- security_settings
  - secret_prefix - prefix for keyvault secret name
  - keyvault_id - the Resource ID of the keyvault to store secret key in.

## Outputs
  - account.id - The cosmos DB account resource id.
  - account.name - The Name of the CosmosDB account
  - account.endpoint - The URL of the account
  
