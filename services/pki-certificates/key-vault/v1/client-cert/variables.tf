variable organization {
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
# I break these out to make it easier to loop on the module and just vary the name 
# of the client cert.
variable cert_details {
    type = object({
        common_name : string # The subject of the cert, for a client this is usually an email address.
        key_vault_path : string # Many characters are not allowed in a KV path, so I allow it to be passed in.
    })
}
variable service_settings {
    type = object({
        key_vault_resource_id : string 
        issuing_cert_name : string 
        validity_hours : number
        private_key_algorithim: string 
        private_key_size: string
    })
    default = {
        key_vault_resource_id: "/subscriptions/634cdf5a-6a7b-4bae-828b-41e87ab1378c/resourceGroups/erx-ops-backend-us-east/providers/Microsoft.KeyVault/vaults/stevedi-test-vault"
        issuing_cert_name : "int2-cert"
        private_key_algorithim: "RSA"
        validity_hours: 8760 # 1 year
        private_key_size: "4096"
    }
}
