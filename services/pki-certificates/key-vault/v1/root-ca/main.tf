resource tls_private_key ca_key {
   algorithm = var.service_settings.private_key_algorithim
   rsa_bits  = var.service_settings.private_key_size
}


resource tls_self_signed_cert ca_cert {
   private_key_pem = tls_private_key.ca_key.private_key_pem
   key_algorithm = "RSA"
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
   # 175200 = 20 years
   validity_period_hours = 175200
   allowed_uses = [
     "cert_signing",
     "crl_signing"
   ]
   is_ca_certificate = true 

}

# Save CA information back out to Azure KeyVault
# Azure KV strips newlines out of these secrets, you can escape them
# so that they survive, but seems safest to base64 encode
resource azurerm_key_vault_secret ca_cert_key {
  name          = "${var.service_settings.cert_name}-key"
  key_vault_id  = var.service_settings.key_vault_resource_id
  value         = base64encode(tls_private_key.ca_key.private_key_pem)  
}
resource azurerm_key_vault_secret ca_cert_cert {
  name          = "${var.service_settings.cert_name}-cert"
  key_vault_id  = var.service_settings.key_vault_resource_id
  value         = base64encode(tls_self_signed_cert.ca_cert.cert_pem)  
}
# When creating intermediates you need a chain of certs going back to root
# This is a recusive thing, so at the root of the recursion you have the 
# root CA cert.
resource azurerm_key_vault_secret ca_cert_chain {
  name          = "${var.service_settings.cert_name}-chain"
  key_vault_id  = var.service_settings.key_vault_resource_id
  value         = base64encode(tls_self_signed_cert.ca_cert.cert_pem)  
}
resource azurerm_key_vault_secret ca_cert_bundle {
  name          = "${var.service_settings.cert_name}-bundle"
  key_vault_id  = var.service_settings.key_vault_resource_id
  value         = base64encode("${tls_private_key.ca_key.private_key_pem}${tls_self_signed_cert.ca_cert.cert_pem}")  
}


