# Create and Azure Key Vault

## Azure Resources Created

### Directly

[azurerm_key_vault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault)

### Indirectly

[azurerm_monitor_metric_alert](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_metric_alert)

## Inputs

- context - This is the output of the resource-group module.  Which provides azure location and resource group to provision infrastructure in.
** Service Settings

- observability - This is an object that describes Log Analytics work space ID and an Azure storage_account for specifying long term storage of logs.  It also specifies action_groups to handle alerts setup by this module.

- service_settings

  - name - the name of the KeyVault, it will have prefix 'kv-' pre-pended.


## Outputs

- id - the keyvault id
- uri - used in actions to add / remove values from the Key Vault.

## Example Usage 

See github terraform-azurerm-samples folder /samples/scenarios/02-keyvault for a working demo of this code. 

```hcl
module "keyvault" {
  
  source                    = "../../../submodules/terraform-azurerm/services/keyvault/endpoint/base/v1"
  # 
  # The context (Where) to deploy the keyvault to
  #
  context                   = module.coreinfra.context
  #
  # The Observability settings that help create keyvault
  # in a best practices manner
  observability_settings    = module.coreinfra.observability_settings
  
  # KeyVault specific settings 
  service_settings = {
    name                    = "${module.coreinfra.context.application_name}-${module.coreinfra.context.environment_name}-${module.coreinfra.context.location.suffix}"
  }

}
 
```

