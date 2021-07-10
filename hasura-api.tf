resource "azurerm_container_group" "hasura" {
  location = azurerm_resource_group.terrazuragrp.location
  name = "terrazura-hasura-api"
  os_type = "Linux"
  resource_group_name = azurerm_resource_group.terrazuragrp.name
  ip_address_type = "public"
  dns_name_label = "terrazuradatalayer"

  container {
    cpu = "0.5"
    image = "hasura/graphql-engine:v2.0.1"
    memory = "1.5"
    name = "hasura-data-layer-api"

    ports {
      port = var.apiport
      protocol = "TCP"
    }

    environment_variables = {
      HASURA_GRAPHQL_SERVER_PORT = var.apiport
      HASURA_GRAPHQL_ENABLE_CONSOLE = false
    }
    secure_environment_variables = {
      HASURA_GRAPHQL_DATABASE_URL = "postgres://${var.username}%40${azurerm_postgresql_server.terrazuraserver.name}:${var.password}@${azurerm_postgresql_server.terrazuraserver.fqdn}:5432/${var.pgdatabase}"
      HASURA_SQLSERVER_URL = "Driver={ODBC Driver 17 for SQL Server};Server=${azurerm_sql_server.sqlserver.fully_qualified_domain_name};Database=${var.sqlserverdb};UID=${var.sqluid};PWD=${var.sqlpwd};"
    }
  }

  tags = {
    environment = "datalayer"
  }
}