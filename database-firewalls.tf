resource "azurerm_sql_firewall_rule" "main" {
  name                = "AlllowAzureServices"
  resource_group_name = azurerm_resource_group.terrazuragrp.name
  server_name         = azurerm_sql_server.sqlserver.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}

resource "azurerm_postgresql_firewall_rule" "terrazurarule" {
  end_ip_address = "0.0.0.0"
  start_ip_address = "0.0.0.0"
  name = "allow-azure-internal"
  resource_group_name = azurerm_resource_group.terrazuragrp.name
  server_name = azurerm_postgresql_server.terrazuraserver.name
}
