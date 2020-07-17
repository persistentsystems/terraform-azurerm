resource tls_private_key key {
   algorithm = "RSA"
   rsa_bits = 4096
}

resource "tls_cert_request" "server" {
   key_algorithm = "RSA"
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
# sign it 
# 
resource tls_locally_signed_cert server {
    cert_request_pem   = tls_cert_request.server.cert_request_pem
    ca_key_algorithm   = "RSA"
    ca_private_key_pem = var.ca_key_file
    ca_cert_pem        = var.ca_pem_data
    # 5 years
    validity_period_hours = var.validity_hours
    allowed_uses = [
        "key_encipherment",
        "digital_signature",
        "server_auth",
    ]    
}

resource local_file private_key {
    sensitive_content = tls_private_key.key.private_key_pem
    filename = "${var.output_cert_path}/key.pem"
    file_permission = "0600"
}
resource local_file cert_file {
    sensitive_content = tls_locally_signed_cert.server.cert_pem
    filename = "${var.output_cert_path}/cert.pem"
    file_permission = "0600"
}
resource local_file pem_bundle {
    sensitive_content = "${tls_private_key.key.private_key_pem}${tls_locally_signed_cert.server.cert_pem}"
    filename = "${var.output_cert_path}/cert-bundle.pem"
    file_permission = "0600"
}
