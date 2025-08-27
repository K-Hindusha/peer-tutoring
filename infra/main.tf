# Resource Group
resource "azurerm_resource_group" "peer_rg" {
  name     = "peer-tutoring-rg"
  location = "East Asia"
}

# App Service Plan
resource "azurerm_service_plan" "peer_plan" {
  name                = "peer-tutoring-plan"
  location            = azurerm_resource_group.peer_rg.location
  resource_group_name = azurerm_resource_group.peer_rg.name
  os_type             = "Linux"
  sku_name            = "B1"  # Basic tier
}

# Web App
resource "azurerm_linux_web_app" "peer_app" {
  name                = "peer-tutoring-app"
  location            = azurerm_resource_group.peer_rg.location
  resource_group_name = azurerm_resource_group.peer_rg.name
  service_plan_id     = azurerm_service_plan.peer_plan.id

  site_config {
    always_on = true
    application_stack {
      python_version = "3.9"  # change to java_version, php_version if needed
    }
  }

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = "1"
  }
}

# MySQL Database
resource "azurerm_mysql_flexible_server" "peer_db" {
  name                = "peer-tutoring-db"
  location            = azurerm_resource_group.peer_rg.location
  resource_group_name = azurerm_resource_group.peer_rg.name
  administrator_login = "peeradmin"
  administrator_password = "P@ssword1234!"  # use variables/Key Vault in real setup
  sku_name            = "B_Standard_B1ms"
  version             = "8.0"
  storage_mb          = 32768

  delegated_subnet_id = null
  zone                = "1"
}

resource "azurerm_mysql_flexible_database" "peer_db_schema" {
  name                = "peerdb"
  resource_group_name = azurerm_resource_group.peer_rg.name
  server_name         = azurerm_mysql_flexible_server.peer_db.name
  charset             = "utf8"
  collation           = "utf8_general_ci"
}
