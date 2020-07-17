variable issuer_organization {
 type = object ({
     organization      = string
     organizational_unit = string
     street_address    = list(string)
     locality          = string # city
     province          = string # state
     country           = string
     postal_code       = string     
 })  
 default = {
     organization      = "ACME Corp"
     organizational_unit = "Development"
     street_address= ["1234 Main St"]
     locality      = "Beverly Hills"
     province      = "CA"
     country       = "USA"
     postal_code   = "90210"
 }
}

variable dns_names {
    type = list(string)
    description = "List of DNS names."
    default = ["www1.acme.com", "www2.acme.com", "www3.acme.com" ]
}
variable ip_addresses {
    type = list(string)
    description = "List of IP address (put in Subject Alternate Name-SAN)"
    default = [ "127.0.0.1", "192.168.1.1" ]
}

variable validity_hours {
    type = number 
    default = 43800 # 5 years
}
variable output_cert_path {
    type = string
    description = "Base File path of output certificate files."
}
variable ca_key_file {
    type = string 
    description = "Path of the key file of certificate to sign with."
}
variable ca_pem_data {
    type = string 
    description = "PEM data of CA certificate to sign with."
}