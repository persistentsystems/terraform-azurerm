variable key_vault_resource_id {
    type = string 
    description = "Full microsoft resource id. /subscriptions/{guid}/resourceGroups/{rg name}/providers/Microsoft.KeyVault/vaults/{keyvault name}"
}

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
        cert_name: "test-cert-ca"  # KeyVauilt key name
        key_vault_resource_id: var.key_vault_resource_id
    }
}