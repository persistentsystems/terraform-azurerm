
module "api_hosting_plan" {
  
  source           = "../../../../../../../services/app-service/plan/premium/base/v1"

  context          = var.context
  
  service_settings = var.service_settings

}