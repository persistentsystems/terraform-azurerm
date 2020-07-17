resource tls_private_key ca_key {
   algorithm = "RSA"
   rsa_bits = 4096
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
resource local_file private_key {
    sensitive_content = tls_private_key.ca_key.private_key_pem
    filename = "${var.output_cert_path}/ca-key.pem"
    file_permission = "0600"
}
resource local_file ca_file {
    sensitive_content = tls_self_signed_cert.ca_cert.cert_pem
    filename = "${var.output_cert_path}/ca-cert.pem"
    file_permission = "0600"
}
resource local_file ca_pem_bundle {
    sensitive_content = "${tls_private_key.ca_key.private_key_pem}${tls_self_signed_cert.ca_cert.cert_pem}"
    filename = "${var.output_cert_path}/ca-bundle.pem"
    file_permission = "0600"
}
