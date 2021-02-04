# Create a Storage Account 

This creates a storage account with randomized name.

## Azure Resources Created 

[azurerm_storage_account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account)

## Inputs 
- context - This is the output of the resource-group module.  Which provides azure location and resource group to provision infrastructure in.

- service_settings 
  - name - a storage account name 'st' will be prepended to it.  Any deshes in this string will be removed.  Azure is pretty limited on storage account naming.
  - tier 
    - Standard (Recommended)
    - Premium
  - type [ LRS | GRS | RAGRS | ZRS | GZRS | RAGZRS ]
  - allow_blob_public_access - Allow a blob to be created with public access [ True | False ]
  - min_tls_version [ TLS1_0 | TLS1_1 | TLS1_2 (recommended)]

## Outputs

- id - Storage Account ID
- name - Storage Acconunt Name
- primary_access_Key - Returns the secret that allows access to the storage 
- primary_endpoint - The URL used to acess this storage account.
- primary_connection_string - A string with access key embeded to access the account
- storage_account - The raw azurerm_storage_account structure, with all attributes available.





