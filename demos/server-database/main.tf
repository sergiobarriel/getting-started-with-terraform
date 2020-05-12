resource "azurerm_resource_group" "demo" {
  name     = var.azure_resource_group
  location = var.azure_location
}

resource "azurerm_sql_server" "demo" {
  name                          = "terraform-demo-sql-server"
  resource_group_name           = azurerm_resource_group.demo.name
  location                      = var.azure_location
  version                       = var.azure_sql_server_version
  administrator_login           = var.azure_sql_server_username
  administrator_login_password  = var.azure_sql_server_password
  tags                          = var.azure_common_tags 
}

resource "azurerm_sql_elasticpool" "demo" {
  name                          = var.azure_elastic_pool_name
  resource_group_name           = azurerm_resource_group.demo.name
  location                      = var.azure_location
  server_name                   = azurerm_sql_server.demo.name
  edition                       = var.azure_elastic_pool_edition
  dtu                           = var.azure_elastic_pool_total_dtu
  db_dtu_min                    = var.azure_elastic_pool_min_database_dtu
  db_dtu_max                    = var.azure_elastic_pool_max_database_dtu
  pool_size                     = var.azure_elastic_pool_max_database_size
  tags                          = var.azure_common_tags 
}

resource "azurerm_sql_database" "demo" {
  count                         = 5
  name                          = "database-${var.azure_sql_database_names[count.index]}"
  resource_group_name           = azurerm_resource_group.demo.name
  location                      = var.azure_location
  server_name                   = azurerm_sql_server.demo.name
  tags                          = var.azure_common_tags
  collation                     = var.azure_sql_database_collation 
  elastic_pool_name             = azurerm_sql_elasticpool.demo.name
}


resource "azurerm_sql_firewall_rule" "demo" {
  name                = "Firewall rule"
  resource_group_name = azurerm_resource_group.demo.name
  server_name         = azurerm_sql_server.demo.name
  start_ip_address    = chomp(data.http.current_ip.body)
  end_ip_address      = chomp(data.http.current_ip.body)
}
