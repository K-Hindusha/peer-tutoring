output "static_web_app_url" {
  description = "The URL of the Static Web App"
  value       = "https://${data.azurerm_static_web_app.main.default_host_name}"
}

output "static_web_app_api_key" {
  description = "The API key for deploying to Static Web App"
  value       = data.azurerm_static_web_app.main.api_key
  sensitive   = true
}

output "resource_group_name" {
  description = "The name of the resource group"
  value       = data.azurerm_resource_group.main.name
}