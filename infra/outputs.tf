output "static_web_app_hostname" {
  description = "Default hostname for the Static Web App"
  value       = azurerm_static_web_app.swa.default_host_name
}
