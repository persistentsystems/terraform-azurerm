module "app" {
  
  source  = "../../../../../services/aad/application/graph-read/v1"
  name    = var.name
  identifier_uris  = [ var.application_id_uri ] 

}
module "sp" {
  
  source          = "../../../../../../services/aad/service-principal/base/v1"
  application_id  = module.app.application_id

}