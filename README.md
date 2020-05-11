# Getting started with Terraform

## Install

```bash
choco install terraform
```

## Syntax

### variables (.tf)

All variables must be inside this file. 

Terraform variable is defined on variables.tf file as:

```terraform
variable "variable_name" {
    type            = string
    default         = "value"
}
```

The syntax for get any variable from variables.tf is:

```terraform
var.variable_name
```

Secrets can store here but **it's not recommended** because this file maybe will be store on control version system and any user can reveal the secret.

This secret (or any variable) can be replaced when *apply* command is executed as:

```terraform
terraform apply -var="variable_name=value"
```

### config (.tf)

On this file we can define different [providers](https://www.terraform.io/docs/providers/index.html) that we will use on our process.

```terraform
provider "azurerm" {
  subscription_id = var.azure_subscription_id
  tenant_id       = var.azure_tenant_id
  client_id       = var.azure_client_id
  client_secret   = var.azure_client_secret
  features {}
}
```
Note: you can generate variables like client ID and client secret [using this guide](/docs/how-to-generate-client-credentials.md)

### main (.tf)

This file contains all resources that Terraform will create, update or delete on specific vendor infrastructure.

With Terraform you can create on Azure all services defined on this [document](https://www.terraform.io/docs/providers/azurerm/index.html).

For example, to create an App Service with related App Service Plan.

```terraform
resource "azurerm_app_service_plan" "namespace" {
  name                    = "service_plan_name"
  location                = var.azure_location
  resource_group_name     = var.azure_resource_group
  kind                    = "Windows"
  sku {
    tier = "Free"
    size = "F1"
  }
  tags                    = var.azure_common_tags 
}

resource "azurerm_app_service" "namespace" {
  name                    = "app-service-name"
  resource_group_name     = var.azure_resource_group
  location                = var.azure_location  
  app_service_plan_id     = azurerm_app_service_plan.namespace.id
  tags                    = var.azure_common_tags
}

```
### output (.tf)

## Main commands

### init

```bash
terraform init
```

### validate

```bash
terraform validate --json
```

```json
```

### apply

```bash
terraform apply
```

### destroy

```bash
terraform destroy
```