resource tls_private_key key {
   algorithm = var.service_settings.private_key_algorithim
   rsa_bits  = var.service_settings.private_key_size
}

resource "tls_cert_request" "server" {
   key_algorithm   = var.service_settings.private_key_algorithim
   private_key_pem = tls_private_key.key.private_key_pem
   dns_names = var.dns_names
   ip_addresses = var.ip_addresses


   subject {
     common_name = var.dns_names[0]
     organization        = var.issuer_organization.organization
     organizational_unit = var.issuer_organization.organizational_unit
     street_address      = var.issuer_organization.street_address
     locality            = var.issuer_organization.locality
     province            = var.issuer_organization.province
     country             = var.issuer_organization.country
     postal_code         = var.issuer_organization.postal_code

   }
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



#
# sign it 
# 
resource tls_locally_signed_cert server {
    cert_request_pem   = tls_cert_request.server.cert_request_pem
    ca_key_algorithm   = var.service_settings.private_key_algorithim
    ca_private_key_pem    = base64decode(data.azurerm_key_vault_secret.ca_cert_key.value) 
    ca_cert_pem           = base64decode(data.azurerm_key_vault_secret.ca_cert_cert.value)
    validity_period_hours = var.service_settings.validity_hours
    allowed_uses = [
        "key_encipherment",
        "digital_signature",
        "server_auth",
    ]    
}

# 
# Save it
# Azure KV strips newlines out of these secrets, you can escape them
# so that they survive, but seems safest to base64 encode
#
resource azurerm_key_vault_secret cert_key {
  name          = "${var.service_settings.cert_name}-key"
  key_vault_id  = var.service_settings.key_vault_resource_id
  value         = base64encode(tls_private_key.key.private_key_pem)  
}
resource azurerm_key_vault_secret cert_cert {
  name          = "${var.service_settings.cert_name}-cert"
  key_vault_id  = var.service_settings.key_vault_resource_id
  value         = base64encode(tls_locally_signed_cert.server.cert_pem)  
}
resource azurerm_key_vault_secret cert_bundle {
  name          = "${var.service_settings.cert_name}-bundle"
  key_vault_id  = var.service_settings.key_vault_resource_id
  value         = base64encode("${tls_private_key.key.private_key_pem}${tls_locally_signed_cert.server.cert_pem}")  
}

