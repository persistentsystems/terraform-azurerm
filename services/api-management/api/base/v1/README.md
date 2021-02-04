# Create an API entry

## Resources Created 
[azurerm_api_management_api](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api)

[azurerm_api_management_api_diagnostic](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management)

[azurerm_api_management_api_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_policy)

[azurerm_api_management_product_api](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_product_api)

## Inputs

- service_settings
  - endpoint -  API Management Name 
  - logger - API Management Logger ID, (output of api/endpoint/base/v1 module)
  - api 
    - name - Name of API (keep it simple)
    - description - Also the Display Name, a Description of the API
    - revision - Revision of the API 
    - path - URL path for this API
    - service_url - Absolute URL of backend service implementing this API (Azure Function or other URL)
    - products - List of strings of product_ids that have access to this API
    - subscription_required - is a subscription required to access this API entry
    - policies
      - inbound
      - outbound
      - backend
      - error


