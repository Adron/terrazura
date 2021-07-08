terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.41.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "terrazuragrp" {
  name = "terrazura_grp"
  location = "westus2"
}

resource "azurerm_container_group" "hasura" {
  location = azurerm_resource_group.terrazuragrp.location
  name = "terrazura-hasura-api"
  os_type = "Linux"
  resource_group_name = azurerm_resource_group.terrazuragrp.name
  ip_address_type = "public"
  dns_name_label = "terrazuradatalayer"

  container {
    cpu = "0.5"
    image = "hasura/graphql-engine:v2.0.0-alpha.9"
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
      HASURA_GRAPHQL_DATABASE_URL = "postgres://${var.username}%40${azurerm_postgresql_server.terrazuraserver.name}:${var.password}@${azurerm_postgresql_server.terrazuraserver.fqdn}:5432/${var.database}"
      HASURA_SQLSERVER_URL = "Driver={ODBC Driver 17 for SQL Server};Server=terrazurasqlserver.database.windows.net;Database=sales_regions;UID=4dm1n157r470r;PWD=4-v3ry-53cr37-p455w0rd;"
    }
  }

  tags = {
    environment = "datalayer"
  }
}

variable "username" {}

variable "password" {}

variable "server" {}

variable "apiport" {}

variable "database" {}

output "hasura_uri_path" {
  value="${azurerm_container_group.hasura.fqdn}:${var.apiport}"
}
