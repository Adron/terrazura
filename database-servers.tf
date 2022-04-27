resource "azurerm_postgresql_server" "terrazuraserver" {
  name = var.server
  location = azurerm_resource_group.terrazuragrp.location
  resource_group_name = azurerm_resource_group.terrazuragrp.name
  sku_name = "B_Gen5_2"

  storage_mb = "5120"
  backup_retention_days = 7
  geo_redundant_backup_enabled = false
  auto_grow_enabled = true

  administrator_login = var.username
  administrator_login_password = var.password
  ssl_enforcement_enabled = true
  version = "11"
}

# resource "azurerm_sql_server" "sqlserver" {
#   name                         = "terrazurasqlserver"
#   resource_group_name          = azurerm_resource_group.terrazuragrp.name
#   location                     = azurerm_resource_group.terrazuragrp.location
#   version                      = "12.0"
#   administrator_login          = "4dm1n157r470r"
#   administrator_login_password = "4-v3ry-53cr37-p455w0rd"
# }

# terrazurasqlserver.database.windows.net