# Create an API Management Product

An API management product allows you to give access to sets of APIs, and to do things like Rate-Limit users to apis.

This is a pretty thin wrapper to the resource, you may consider
directly creating the resource.

## Resources Created

[azurerm_api_management_product](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_product)


```hcl
resource "azurerm_api_management_product" "product" {

  resource_group_name   = var.context.resource_group_name
  api_management_name   = var.service_settings.endpoint

  product_id            = var.service_settings.product.id
  display_name          = var.service_settings.product.description
  
  subscription_required = var.service_settings.product.subscription_required
  subscriptions_limit   = var.service_settings.product.subscriptions_limit

  approval_required     = var.service_settings.product.approval_required
  published             = var.service_settings.product.publish

}
```

## Outputs
- id - the ID of this resource
- product_id - the ID of the product created (you probably want this value.)


