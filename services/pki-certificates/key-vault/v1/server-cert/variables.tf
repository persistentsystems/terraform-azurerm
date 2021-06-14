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
}

variable dns_names {
    type = list(string)
    description = "List of DNS names. EG: ['www1.acme.com', 'www2.acme.com', 'www3.acme.com' ] "
    #default = ["www1.acme.com", "www2.acme.com", "www3.acme.com" ]
}
variable ip_addresses {
    type = list(string)
    description = "List of IP address (put in Subject Alternate Name-SAN)"
    #default = [ "127.0.0.1", "192.168.1.1" ]
}

variable validity_hours {
    type = number 
    default = 43800 # 5 years
}

variable service_settings {
    type = object({
        key_vault_resource_id : string 
        issuing_cert_name : string 
        cert_name : string
        validity_hours : number
        private_key_algorithim: string 
        private_key_size: string
    })
    #default = {
    #    key_vault_resource_id: "/subscriptions/634cdf5a-6a7b-4bae-828b-41e87ab1378c/resourceGroups/erx-opsdr-backend-us-north/providers/Microsoft.KeyVault/vaults/stevedi-test-vault"
    #    issuing_cert_name : "int2-cert"
    #    cert_name: "server-cert"
    #    private_key_algorithim: "RSA"
    #    validity_hours: 43800 # 5 years
    #    private_key_size: "4096"
    #}
}
