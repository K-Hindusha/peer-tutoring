output "webapp_url" {
  value = azurerm_linux_web_app.peer_app.default_hostname
}
