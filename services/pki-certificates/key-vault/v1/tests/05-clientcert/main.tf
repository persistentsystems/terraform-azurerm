# See client-certs.auto.tfvars
variable client_certs {
    type = map(string)
}

module "client_cert" {
    source = "../../client-cert"
    service_settings = {
        key_vault_resource_id: "/subscriptions/634cdf5a-6a7b-4bae-828b-41e87ab1378c/resourceGroups/erx-drops-backend-us-north/providers/Microsoft.KeyVault/vaults/stevedi-test-vault"
        issuing_cert_name: "int2-cert"
        cert_name: "myserver"
        validity_hours: 87658 # 10 years
        private_key_algorithim: "RSA"
        private_key_size: 4096
    }
    for_each = var.client_certs 
    cert_details = {
        common_name = each.value 
        key_vault_path = each.key
    }

}