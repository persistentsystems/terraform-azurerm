# Create an intermediate cert Authority

This module creates a child cert of the CA certificate passed in.  Each
person calling this module can call this intermediate as many times as
they want to create as deep of nesting as needed.

As a practical matter you can't nest certs terribly deep due to expiration
times.  A child CA cannot issue a certifcate that is valid longer than
it's parent.  So as the expiration dates get closer to current date, the
number of usefull levels gets limited.

## Example Usage:

```hcl
variable key_vault_resource_id {
    type = string 
    description = "/subscriptions/{guid}/resourceGroups/{rg name}/providers/Microsoft.KeyVault/vaults/{keyvault name}"
}

module "intca" {
    source = "../../int-ca"
    common_name = "ACME.com Intermediate-1 CA"
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
        key_vault_resource_id: var.key_vault_resource_id
        issuing_cert_name: "test-cert-ca"
        cert_name: "int1-cert"
        validity_hours: 131487 # 15 years
        private_key_algorithim: "RSA"
        private_key_size: 4096
    }

}
```

