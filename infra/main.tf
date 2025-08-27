terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
  required_version = ">=1.1.0"
}

provider "azurerm" {
  features {}
}

# Resource Group
resource "azurerm_resource_group" "peer_rg" {
  name     = "peer-tutoring-rg"
  location = "East US"
}

# Static Web App
resource "azurerm_static_web_app" "peer_swa" {
  name                = "peer-tutoring-swa"
  resource_group_name = azurerm_resource_group.peer_rg.name
  location            = azurerm_resource_group.peer_rg.location

  sku_tier = "Free"
  sku_size = "Free"
}
