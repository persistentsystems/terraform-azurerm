resource tls_private_key int_key {
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
data azurerm_key_vault_secret ca_cert_bundle {
  name          = "${var.service_settings.issuing_cert_name}-bundle"
  key_vault_id  = var.service_settings.key_vault_resource_id
}
data azurerm_key_vault_secret ca_cert_chain {
  name          = "${var.service_settings.issuing_cert_name}-chain"
  key_vault_id  = var.service_settings.key_vault_resource_id
}


# CSR
resource "tls_cert_request" "int" {
    private_key_pem=tls_private_key.int_key.private_key_pem
    key_algorithm="RSA"
    subject {
     common_name         = var.common_name
     organization        = var.issuer_organization.organization
     organizational_unit = var.issuer_organization.organizational_unit
     street_address      = var.issuer_organization.street_address
     locality            = var.issuer_organization.locality
     province            = var.issuer_organization.province
     country             = var.issuer_organization.country
     postal_code         = var.issuer_organization.postal_code
    }
 
}

# Create the Cert
resource "tls_locally_signed_cert" "int" {
    cert_request_pem      = tls_cert_request.int.cert_request_pem
    ca_key_algorithm      = var.service_settings.private_key_algorithim
    ca_private_key_pem    = base64decode(data.azurerm_key_vault_secret.ca_cert_key.value) 
    ca_cert_pem           = base64decode(data.azurerm_key_vault_secret.ca_cert_cert.value)
    validity_period_hours = var.service_settings.validity_hours
    allowed_uses = [
      "cert_signing",
      "crl_signing"
    ]
    is_ca_certificate = true    
}

#
# Save this cert back out to KeyVault
# Azure KV strips newlines out of these secrets, you can escape them
# so that they survive, but seems safest to base64 encode

#
resource azurerm_key_vault_secret cert_key {
  name          = "${var.service_settings.cert_name}-key"
  key_vault_id  = var.service_settings.key_vault_resource_id
  value         = base64encode(tls_private_key.int_key.private_key_pem)  
}
resource azurerm_key_vault_secret cert_cert {
  name          = "${var.service_settings.cert_name}-cert"
  key_vault_id  = var.service_settings.key_vault_resource_id
  value         = base64encode(tls_locally_signed_cert.int.cert_pem)  
}
resource azurerm_key_vault_secret cert_bundle {
  name          = "${var.service_settings.cert_name}-bundle"
  key_vault_id  = var.service_settings.key_vault_resource_id
  value         = base64encode("${tls_private_key.int_key.private_key_pem}${tls_locally_signed_cert.int.cert_pem}")  
}
# append our cert to the chain, in front of existing chain.
# this value keeps growing as the cert chain gets generations
resource azurerm_key_vault_secret cert_chain {
  name          = "${var.service_settings.cert_name}-chain"
  key_vault_id  = var.service_settings.key_vault_resource_id
  value         = base64encode("${tls_locally_signed_cert.int.cert_pem}${base64decode(data.azurerm_key_vault_secret.ca_cert_chain.value)}")  
}

