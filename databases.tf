# resource "azurerm_sql_database" "main" {
#   name                             = var.sqlserverdb
#   resource_group_name              = azurerm_resource_group.terrazuragrp.name
#   location                         = azurerm_resource_group.terrazuragrp.location
#   server_name                      = azurerm_sql_server.sqlserver.name
#   edition                          = "Standard"
#   requested_service_objective_name = "S0"
# }

resource "azurerm_postgresql_database" "terrazuradb" {
  name = var.pgdatabase
  resource_group_name = azurerm_resource_group.terrazuragrp.name
  server_name = azurerm_postgresql_server.terrazuraserver.name
  charset = "UTF8"
  collation = "English_United States.1252"
}
