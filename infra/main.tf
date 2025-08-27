# Resource Group
resource "azurerm_resource_group" "peer_rg" {
  name     = "peer-tutoring-rg"
  location = var.location
}

# Static Web App
resource "azurerm_static_web_app" "peer_swa" {
  name                = "peertutoringapp"   # must be unique, lowercase, no spaces
  resource_group_name = azurerm_resource_group.peer_rg.name
  location            = var.location

  sku_tier = "Free"
  sku_size = "Free"
}


