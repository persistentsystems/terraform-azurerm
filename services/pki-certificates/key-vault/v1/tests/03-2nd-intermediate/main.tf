variable key_vault_resource_id {
    type = string 
    description = "Full microsoft resource id. /subscriptions/{guid}/resourceGroups/{rg name}/providers/Microsoft.KeyVault/vaults/{keyvault name}"
}

module "intca" {
    source = "../../int-ca"
    common_name = "ACME.com Intermediate-2 CA"
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
        cert_name: "int2-cert"
        validity_hours: 87658 # 10 years
        private_key_algorithim: "RSA"
        private_key_size: 4096
    }

}