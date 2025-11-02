# Reference existing Resource Group (not manage it)
data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}

# Reference existing Static Web App (not manage it)
data "azurerm_static_web_app" "main" {
  name                = var.static_web_app_name
  resource_group_name = data.azurerm_resource_group.main.name
}