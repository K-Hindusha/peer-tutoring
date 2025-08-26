resource "azurerm_resource_group" "rg" {
  name     = "peer-tutoring-rg"
  location = "East Asia"
}

resource "azurerm_static_site" "swa" {
  name                = "peer-tutoring-frontend"
  resource_group_name = azurerm_resource_group.rg.name
  location            = "East Asia"
  sku_tier            = "Free"
}
