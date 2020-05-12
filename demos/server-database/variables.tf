# Subscription
variable "azure_subscription_id" {
    type            = string
    default         = "11111111-1111-1111-1111-111111111111"
}

# Tenant
variable "azure_tenant_id" {
    type            = string
    default         = "22222222-2222-2222-2222-222222222222"
}

# Credentials
variable "azure_client_id" {
    type            = string
    default         = "33333333-3333-3333-3333-333333333333"
}

variable "azure_client_secret" {
    type            = string
    default         = "ABCabc1234"
}

# Common options

variable "azure_location" {
    type            = string
    default         = "West Europe"
}

variable "azure_common_tags" {
    type = map
    default = {
        author      = "Sergio Barriel"        
    }
}

# Resource variables

# Resource group

variable "azure_resource_group" {
    type            = string
    default         = "Terraform-demo"
}

# SQL Server

variable "azure_sql_server_username" {
    type            = string
    default         = "kerberos"
}

variable "azure_sql_server_password" {
    type            = string
    default         = "ABCabc1234"
}

variable "azure_sql_server_version" {
    type            = string
    default         = "12.0"
}


# Elastic pool

variable "azure_elastic_pool_total_dtu" {
    default           = 50
}

variable "azure_elastic_pool_min_database_dtu" {
    default           = 0
}

variable "azure_elastic_pool_max_database_dtu" {
    default           = 5
}

variable "azure_elastic_pool_edition" {
    default           = "Basic"
}

variable "azure_elastic_pool_max_database_size" {
    default           = 5000
    description       = "Size in Mb"
}



# SQL Database

variable "azure_sql_database_collation" {
    type            = string
    default         = "Latin1_General_CI_AI"
}

variable "azure_elastic_pool_name" {
    type            = string
    default         = "terraform-demo-elastic-pool"
}

variable "azure_sql_database_names" {
    type            = list(string)
    default         = ["one", "two", "three", "four", "five"]
}

data "http" "current_ip" {
    url             = "http://ipv4.icanhazip.com"
}

