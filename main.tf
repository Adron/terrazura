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

resource "azurerm_postgresql_database" "terrazuradb" {
  name = var.database
  resource_group_name = azurerm_resource_group.terrazuragrp.name
  server_name = azurerm_postgresql_server.terrazuraserver.name
  charset = "UTF8"
  collation = "English_United States.1252"
}

resource "azurerm_postgresql_firewall_rule" "terrazurarule" {
  end_ip_address = "0.0.0.0"
  start_ip_address = "0.0.0.0"
  name = "allow-azure-internal"
  resource_group_name = azurerm_resource_group.terrazuragrp.name
  server_name = azurerm_postgresql_server.terrazuraserver.name
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
    image = "hasura/graphql-engine:v2.0.0-alpha.1"
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
