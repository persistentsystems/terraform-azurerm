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
variable common_name {
    type = string 
    description = "Common name in the certificate."
}
variable service_settings {
    type = object({
        key_vault_resource_id : string 
        issuing_cert_name: string 
        cert_name : string
        validity_hours : number
        private_key_algorithim: string 
        private_key_size: string
    })
}
