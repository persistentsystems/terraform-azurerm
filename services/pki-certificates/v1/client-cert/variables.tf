variable validity_hours {
    type = number 
    default = 175200 # 20 years
}
variable output_cert_path {
    type = string
    description = "Base File path of output certificate files."
}
variable ca_key_data {
    type = string 
    description = "Path of the key file of certificate to sign with."
}
variable ca_pem_data {
    type = string 
    description = "Path of CA certificate to sign with."
}
variable subject_name {
    type = string 
    description = "Usually an email addresses."
}
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
