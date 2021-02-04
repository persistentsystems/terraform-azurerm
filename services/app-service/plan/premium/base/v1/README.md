# Create an Azure App Service Plan 

## Resources Created 

azurerm_app_service_plan
azurerm_storage_account 
[azurerm_storage_account_sas](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/storage_account_sas)



## Inputs 

- service_settings
  - name - object name
  - size - EP1, EP2, EP3 (App Service Plan Size)
  - storage_type - LRS, GRS, RAGRS, ZRS, GZRS, RAGZRS (redundancy on code storages account created)
  - minimum_instance_count - minimum number of instances in Elastic Service Plan
  - maximum_instance_count - max scale out of instances


Recommend a Read-Access redundant storage option such as RAGRS or RAGZRS as the storage account that is provisioned for your App Service Plan to use for its operation. If there is an outage with the Storage Service your App Service Plan will have a better chance of continuing to operate normally if it at least has read-only access to this storage account.

## Outputs

- id - service plan ID
- name - service plan Name
- storage_account
  - connection_string - string to conect to storage account
  - name - storage account name
  - access_key - storage account access key
  - sas - Shared Access Signature for the storage account



[Naming Standards](https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/naming-and-tagging)