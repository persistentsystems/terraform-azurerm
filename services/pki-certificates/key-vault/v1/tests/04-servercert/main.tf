module "server_cert" {
    source = "../../server-cert"
    # If a user can ever use https://{ip address}/ , you need to list 
    # out the IP addresses this server can have.  If the user can't
    # or shouldn't access the server via IP then this isn't as important
    # leave 127.0.0.1 in the list so that a process on the server can
    # access the server itself.
    ip_addresses = [ "127.0.0.1", "192.168.1.1"]
    dns_name = ["www1.acme.com", "www2.acme.com", "www3.acme.com" , "api.acme.com" , "acme.com" ]
    issuer_organization = {
        organization      = "ACME Corp"
        organizational_unit = "Development"
        street_address= ["1234 Main St"]
        locality      = "Beverly Hills"
        province      = "CA"
        country       = "USA"
        postal_code   = "90210"
    }

    service_settings = {
        key_vault_resource_id: var.key_vault_resource_id
        issuing_cert_name: "int2-cert"
        cert_name: "myserver"
        validity_hours: 87658 # 10 years
        private_key_algorithim: "RSA"
        private_key_size: 4096
    }

}