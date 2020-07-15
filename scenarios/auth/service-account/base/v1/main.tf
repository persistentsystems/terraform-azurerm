module "app" {
  
  source  = "../../app/graph_read"
  name    = var.name
  identifier_uris  = [ var.application_id_uri ] 

}
module "sp" {
  
  source          = "../../sp/base"
  application_id  = module.app.application_id

}