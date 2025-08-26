output "static_web_app_url" {
  value = "https://${azurerm_static_site.swa.default_host_name}"
}

