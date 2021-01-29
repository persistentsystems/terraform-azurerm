
# Create a Resource Group
Creates a resource group, and almost as importantly outputs a context
variable that can be used on all of the other modules in this Library.

## Azure Resources Created

- [azurerm_resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group)


## Inputs

- Context 

  This is the input context, it is very similar to the output context but is missing the created resource_group_name.

  - application_name - keep it short (like less than 5 characters) as it will prefix all created resources in the future.  Some resources place very strict naming conventions, so all lower case with no punctuation is what will work with all resources.
  - environment_name - ususally a lifecycle (dev, qa , prod) or a feature name (feat234, story123).  Again, keep it short and without punturation.
  - location - where to create this:
    - name - eg: "East US", [Azure Location Name](https://status.azure.com/en-us/status) , We create different resource groups for each region and this will be the default region that resources will be created in.
    - number - this was used for availability zone number, it's currenlthy unused.  We left it in, so that we don't have a breaking change if we need to add it back.  Set it to 1 and forget it for now.
    - suffix - this is appended to the name of all resources created by modules in this library.  Generally just the name with spaces replaced with dashes.  

- Name

As per microsoft naming they reccomend 'rg-' prefix for resource groups.  This name is normally the same as application name, but if you have other standards, this allows you to name resource group.

## Outputs

- id - Resource Group ID
- name - the name of the resource group as created
- location - should be same as context.location.name
- context - A structure with same structure as the input context, but an added resource_group_name that is used extensively by other library modules.

## Example Usage

```hcl
locals {
    context = {
        application_name = "myapp"
        environment_name = "dev"
        location = {
            name = "East US"
            suffix = "east-us"
            number = 1
        }
    }
}
module my_resource_group {
    source = "resource-group/base/v1"
    context = local.context
    name    = "myapp-dev-east-us"
}
```


## Notes:
** [Microsoft Naming Standards](https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/naming-and-tagging)