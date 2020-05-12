output "app_service_id" {
  value = azurerm_app_service.demo.id
}

output "app_service_default_site_hostname" {
  value = azurerm_app_service.demo.default_site_hostname
}

output "app_service_username" {
  value = azurerm_app_service.demo.site_credential[0].username
}

output "app_service_password" {
  value = azurerm_app_service.demo.site_credential[0].password
}