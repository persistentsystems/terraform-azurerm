resource tls_private_key key {
   algorithm = var.service_settings.private_key_algorithim
   rsa_bits  = var.service_settings.private_key_size
}
#
# Read the CA key data that will be creating this cert
#
data azurerm_key_vault_secret ca_cert_key {
  name          = "${var.service_settings.issuing_cert_name}-key"
  key_vault_id  = var.service_settings.key_vault_resource_id
}
data azurerm_key_vault_secret ca_cert_cert {
  name          = "${var.service_settings.issuing_cert_name}-cert"
  key_vault_id  = var.service_settings.key_vault_resource_id
}

resource "tls_cert_request" "client" {
   key_algorithm = "RSA"
   private_key_pem = tls_private_key.key.private_key_pem

   subject {
     common_name         = var.cert_details.common_name
     organization        = var.organization.organization
     organizational_unit = var.organization.organizational_unit
     street_address      = var.organization.street_address
     locality            = var.organization.locality
     province            = var.organization.province
     country             = var.organization.country
     postal_code         = var.organization.postal_code

   }

}

resource tls_locally_signed_cert cert {
    cert_request_pem = tls_cert_request.client.cert_request_pem
    ca_key_algorithm   = var.service_settings.private_key_algorithim
    ca_private_key_pem    = base64decode(data.azurerm_key_vault_secret.ca_cert_key.value) 
    ca_cert_pem           = base64decode(data.azurerm_key_vault_secret.ca_cert_cert.value)
    validity_period_hours = var.service_settings.validity_hours
    allowed_uses = [
        "client_auth"
    ]    
}

# 
# Save it
# Azure KV strips newlines out of these secrets, you can escape them
# so that they survive, but seems safest to base64 encode
#
resource azurerm_key_vault_secret cert_key {
  name          = "${var.cert_details.key_vault_path}-key"
  key_vault_id  = var.service_settings.key_vault_resource_id
  value         = base64encode(tls_private_key.key.private_key_pem)  
}
resource azurerm_key_vault_secret cert_cert {
  name          = "${var.cert_details.key_vault_path}-cert"
  key_vault_id  = var.service_settings.key_vault_resource_id
  value         = base64encode(tls_locally_signed_cert.cert.cert_pem)  
}

# I don't save the cert bundle nor the chain, these will be installed
# on the server not the client, and the server needs one copy of them
# from the issuing CS and not a copy per client.