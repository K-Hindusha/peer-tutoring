terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Static Web App (new resource type)
resource "azurerm_static_web_app" "swa" {
  name                = "peer-tutoring-frontend"
  resource_group_name = "peer-tutoring-rg"   # use the RG you already created
  location            = "East Asia"

  sku_tier = "Free"
  sku_size = "Free"
}

# Output: URL of static web app
output "static_web_app_url" {
  value = azurerm_static_web_app.swa.default_host_name
}
