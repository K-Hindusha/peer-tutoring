# main.tf

# Create Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "peer-tutoring-rg"
  location = var.location
}

# Create Static Web App inside that RG
resource "azurerm_static_web_app" "swa" {
  name                = "peer-tutoring-swa"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku_tier            = "Free"

  tags = {
    project = "peer-tutoring"
  }
}



