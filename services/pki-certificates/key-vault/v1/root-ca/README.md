# Create a Root Certificate Authority

This module creates a root certificate authority and stores the 
output in the specified Azure Key Vault.

Azure has KeyVault for storing certificates, but doesn't have a SaaS 
PKI infrastructure offering.  These terraform modules will allow you 
to create a PKI infrastructure inside of terraform.  You will be able 
create certificates for clients and servers in terraform.

The module uses the internal PKI calls of Terraform and does not 
rely on any 3rd party (ie: Azure) services in the certificate creation.
This version of the module does store the generated certs in Azure KeyVault
for secure storage, and survivability in case the Terraform state file 
is lost, or somebody does a destroy on the project.

First you need to create a RootCA, which is this module.  The RootCA
is self signed and valid for 20 years.

## Example Usage 
```hcl
module "rootca" {
    source = "../../root-ca"
    common_name = "ACME.com Root CA"
    issuer_organization = {
        organization      = "ACME Corp"
        organizational_unit = "Development"
        street_address= ["1234 Main St"]
        locality      = "Beverly Hills"
        province      = "CA"
        country       = "USA"
        postal_code   = "90210"
    }
    service_settings = {
        private_key_algorithim: "RSA"
        validity_hours: 175200  #20 years
        private_key_size: 4096
        cert_name: "test-cert-ca" # KeyVault key name
        key_vault_resource_id: var.key_vault_resource_id
    }
}
```

Functional Examples are in a separate GitHub repository [terraform_azurerm_examples](https://github.com/persistentsystems/terraform-azurerm-samples)


