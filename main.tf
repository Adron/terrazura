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

variable "username" {}

variable "password" {}

variable "server" {}

variable "apiport" {}

variable "pgdatabase" {}

variable "sqlserverdb" {}

variable "sqluid" {}

variable "sqlpwd" {}

output "hasura_uri_path" {
  value="${azurerm_container_group.hasura.fqdn}:${var.apiport}"
}

output "sqlserver_dsn" {
  value="Driver={ODBC Driver 17 for SQL Server};Server=${azurerm_sql_server.sqlserver.fully_qualified_domain_name};Database=${var.sqlserverdb};UID=${var.sqluid};PWD=${var.sqlpwd};"
}