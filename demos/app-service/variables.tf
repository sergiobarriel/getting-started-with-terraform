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
