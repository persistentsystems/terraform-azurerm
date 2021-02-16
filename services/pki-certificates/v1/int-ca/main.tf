resource tls_private_key ca_key {
   algorithm = "RSA"
   rsa_bits = 4096
}


# CSR
resource "tls_cert_request" "int" {
    private_key_pem=tls_private_key.ca_key.private_key_pem
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
resource "tls_locally_signed_cert" "ca" {
    cert_request_pem      = tls_cert_request.int.cert_request_pem
    ca_key_algorithm      = "RSA"
    # key data (not path)
    ca_private_key_pem    = var.ca_key_data
    # this wants the data (not a path)
    ca_cert_pem           = var.ca_pem_data
    validity_period_hours = var.validity_hours
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
    sensitive_content = tls_locally_signed_cert.ca.cert_pem
    filename = "${var.output_cert_path}/ca-cert.pem"
    file_permission = "0600"
}
resource local_file ca_pem_bundle {
    sensitive_content = "${tls_private_key.ca_key.private_key_pem}${tls_locally_signed_cert.ca.cert_pem}"
    filename = "${var.output_cert_path}/ca-bundle.pem"
    file_permission = "0600"
}
