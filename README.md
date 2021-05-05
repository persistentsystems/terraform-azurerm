# Terraform-AzureRM

Welcome to the Persistent Systems Ltd terraform repository for Azure
resources.  We are passionate users of Terraform and we wanted to give
back to the community.  This respository is in real production use by
our clients in real projects.  

## Our Goals of this Project

### Document AzureRM resource usage

To help document how to use azurerm terraform resources.  Often 
you will spend a fair amount of time trying to find a real-world 
working example of a resource.  We hope that this provides some 
context as to how to string together several azurerm resources into
intrastructure.

### To ease creation of Production Ready Code

This code is opinionated:

-Items created should have AppInsights and/or Log Analytics attached
-Security permissions should be automatic and mandatory.  (EG: if an 
entry point can be http or https, it should only be https).
-Consistent naming of resources should be easy.


### To not start from scratch on every project


There are some basics that you need on every project. You need a resource
group, you probably want some base services: Key-Vault, Cosmos, API 
management.  We don't force much, but you should not be starting with a 
blank editor window when you want to create a CosmosDB table and its 
associated infrastructure.

### We want to give back

We have created fixes and PRs for some of the Azure Resources we have
had issues with, but we derive a lot of benefit of team with many years
of terraform experience.

## Repository Organzation
There are two major folder structures off of the root folder.  The _scenarios_
folder is where we put sample code of how to use the smaller grained
modules in the _services_ folders.  In the _services_ folder are finer
grained services.  These generally are a single Azure service with 
ties into Azure AppInsights and/or Log Analytics.

### Versioning
Whenever a breaking change occurs a new version folder is created.  
Almost always, the breaking change is the addition of a feature that
adds a parameter to the module.  All of the versioning happens in the  
master branch, so you are not tied to all or northing version upgrades.

You should be able to safely pull the head revision of master and
other than bug-fixes, no functionality changes should occur.

### Variables
We make a lot of use of passing in variables types of object.  This
allows us to group common parameters to a function, and allows the caller
to re-use outputs of one module in another. It also allows you to declare
local variables with groups of parameters and pass them into a function 
in one shot.

#### Common Variable Names:
The input variable __context__ is the context in which this new resource 
will be created.  At a minimum the context contains all of the resource
group information (Name, Location) that are required on a lot of AzureRM
resources.  The __context__ variable is often used, and is most easily
created by using the _resource_group_ module.  It will output a context
that will be used by most all of the other functions.
The standard __context__ is defined as:
```HCL
variable "context" {
  type = object({

    application_name    = string
    environment_name    = string
    resource_group_name = string
    location            = string
    location_suffix     = string

  })
}
```

The input variable __service_settings__ are a collection of settings that
vary service to service.

Another common input variable is __observability_settings__ which is a
combination of Azure Diagnostics and Log Analyics.  Some resources 
support one or the other and some support both.  The Maximal example is:

```HCL
variable "observability_settings" {
  type = object({

    instrumentation_key = string
    workspace_id        = string
    storage_account     = string 
    retention_in_days   = number
  })
}
```

## Where to Start
We will be creating some blogs and other how to's to help you get started
as we realize the leaning curve on this is pretty abrupt.  For a starting
point look at scenarios 1-HelloWorld..



# Test the changes






