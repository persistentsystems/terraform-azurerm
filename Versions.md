# Release Log
## Version 0.1.7

Fixing of services/cosmosdb/endpoint/dual/secure which was not up to date
with changes in services/cosmosdb/endpoint/dual/base.  I moved the 
log analytics workspace_id to observability_settings from service_settings
which breaks the interface, and requires a version bump.  Callers using 
the secure CosmosDB module will need to move the workspace_id from 
service_settings, to observability setttings.

Remove soft delete from KeyVault when using latest azurerm provider
it is now marked as deprecated.
## Version 0.1.6

The first vesion released with the new tagging structure.  All modules
are reset to version v1 (and will probably stay there).  We consider 
this the be the start of the project and this we where we started
annoucing this project to the public.

## Version 0.1.5 and Before

These were releases that were used in the conversion from individual
module versioning, to versioning the library as a whole.  Version v0.1.0 
has the original versioning, if you want to look as a specific older
version of a module.
