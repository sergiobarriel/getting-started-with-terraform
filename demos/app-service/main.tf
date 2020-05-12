resource "azurerm_resource_group" "demo" {
  name     = var.azure_resource_group
  location = var.azure_location
}

resource "azurerm_app_service_plan" "demo" {
  name                    = "demo_terraform_service_plan"
  location                = var.azure_location
  resource_group_name     = azurerm_resource_group.demo.name
  kind                    = "Windows"
  sku {
    tier = "Free"
    size = "F1"
  }
  tags                    = var.azure_common_tags 
}

resource "azurerm_app_service" "demo" {
  name                    = "demo-terraform-app-service"
  resource_group_name     = azurerm_resource_group.demo.name
  location                = var.azure_location  
  app_service_plan_id     = azurerm_app_service_plan.demo.id
  tags                    = var.azure_common_tags
}

