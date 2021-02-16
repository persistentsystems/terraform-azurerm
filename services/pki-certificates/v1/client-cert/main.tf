resource tls_private_key key {
   algorithm = "RSA"
   rsa_bits = 4096
}

resource "tls_cert_request" "client" {
   key_algorithm = "RSA"
   private_key_pem = tls_private_key.key.private_key_pem

   subject {
     common_name         = var.subject_name
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
    ca_key_algorithm = "RSA"
    ca_private_key_pem = var.ca_key_data 
    ca_cert_pem = var.ca_pem_data
    validity_period_hours = var.validity_hours
    allowed_uses = [
        "client_auth"
    ]    
}

resource local_file private_key {
    sensitive_content = tls_private_key.key.private_key_pem
    filename = "${var.output_cert_path}/key.pem"
    file_permission = "0600"
}
resource local_file ca_file {
    sensitive_content = tls_locally_signed_cert.cert.cert_pem
    filename = "${var.output_cert_path}/cert.pem"
    file_permission = "0600"
}
