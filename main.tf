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
    name = "terrazuraserver"
    location = azurerm_resource_group.terrazuragrp.location
    resource_group_name = azurerm_postgresql_server.terrazura_grp.name
}