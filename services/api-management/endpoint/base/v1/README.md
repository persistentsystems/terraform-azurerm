# Create an API management Endpoint (URL)

## Resources Created

azurerm_api_management_logger

[azurerm_api_management](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management)

Various Diagnostic settings (by calling another module)


## Inputs
- context - Standard context as created by the Resource Group module
- observability settings 
- service_settings
  - name - The name of the API management service
  - tier - [Consumption | Developer | Basic | Standard | Premium ]
  - capacity - Number of deploy units of the specified tier.  
  - publisher
    - name - The name of the publisher/company
    - email - eMail of Publisher
  - policies - Various XML snippets to determine policies for:
    - inbound
    - outbound
    - backend
    - error 


## Outputs

- id - API management ID
- name - The final name of the API gateway
- public_ip_addresses - IP addresses the API gateway may use
- public_ip_cidr_ranges - IP addresses in CIDR (/32 appened to each IP address)
- gateway_url - URL of the gateway
- gateway_domain - Domain name of gateway
- logger - (id and name), ID and Name of the App_Insights logger.




