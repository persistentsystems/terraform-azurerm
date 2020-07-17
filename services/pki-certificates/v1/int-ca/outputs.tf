output ca_file {
    value = local_file.ca_file.filename
}
output ca_key_file {
    value = local_file.private_key.filename
}
output ca_bundle_file {
    value = local_file.ca_pem_bundle.filename
}
output ca_pem_data {
    value = tls_locally_signed_cert.ca.cert_pem 
}
output ca_key {
    value = tls_private_key.ca_key.private_key_pem
}