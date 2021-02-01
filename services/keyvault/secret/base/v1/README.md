# Creates an Azure KeyVault Secret

## Resources Created
[azurerm_key_vault_secret](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret)

## Inputs 
- context - This is the output of the resource-group module.  Which provides azure location and resource group to provision infrastructure in.
- service_settings 
  - endpoint - the key_vault_id to create the key in
  - name - the key name to create
  - Value - the value to store (probably safest to base64 endcode the value).

## Outputs
- id - The Secrect ID of the Secret created.
- name - The Name of the Key created.