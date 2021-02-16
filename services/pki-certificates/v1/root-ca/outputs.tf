output ca_file {
    value = local_file.ca_file.filename
}
# For a slight increase in security the private key is not 
# output from the module, but just a filename is output.
# this keeps the full key in a lot fewer state files.
output ca_key_file {
    value = local_file.private_key.filename
}
output ca_bundle_file {
    value = local_file.ca_pem_bundle.filename
}
output ca_pem_data {
    value = tls_self_signed_cert.ca_cert.cert_pem 
}
output ca_key {
    value = tls_private_key.ca_key.private_key_pem
}