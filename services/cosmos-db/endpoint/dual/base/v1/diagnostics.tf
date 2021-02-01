
module "cosmosdb_account_diagnostics" {

  source = "git::https://onpoint-healthcare@dev.azure.com/onpoint-healthcare/infrastructure-modules/_git/azure//modules/services/monitor/diagnostics/base/v1"

  context                 = var.context
  observability_settings  = var.observability_settings

  service_settings = {

    name        = azurerm_cosmosdb_account.account.name
    resource_id = azurerm_cosmosdb_account.account.id

    logs        = [ 
      "DataPlaneRequests", 
      "MongoRequests", 
      "QueryRuntimeStatistics", 
      "PartitionKeyStatistics", 
      "PartitionKeyRUConsumption", 
      "ControlPlaneRequests",
      "CassandraRequests",
      "GremlinRequests"
    ]
    metrics     = [ "Requests" ]

  }

}