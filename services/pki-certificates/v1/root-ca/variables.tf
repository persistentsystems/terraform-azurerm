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
variable common_name {
    type = string 
    description = "Name of the certificate"
    default = "ACME.com Root CA"
}
variable validity_hours {
    type = number 
    default = 175200 # 20 years
}
variable output_cert_path {
    type = string
    description = "Base File path of output certificate files."
}