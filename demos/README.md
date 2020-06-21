# Demos

## Prepare demos

For all demos on this repository, ensure to modify the **variables.tf** file with the correct values:

```terraform
# subscription
variable "azure_subscription_id" {
    type            = string
    default         = "11111111-1111-1111-1111-111111111111"
}

# tenant
variable "azure_tenant_id" {
    type            = string
    default         = "22222222-2222-2222-2222-222222222222"
}

# credentials
variable "azure_client_id" {
    type            = string
    default         = "33333333-3333-3333-3333-333333333333"
}

# credentials
variable "azure_client_secret" {
    type            = string
    default         = "ABCabc1234"
}
```

### Subscription ID

You can find *Subscription ID* value on [Subscriptions](https://portal.azure.com/#blade/Microsoft_Azure_Billing/SubscriptionsBlade) option.

### Tenant ID

You can find *Tenant ID* value by clicking on [Azure Active Directory](https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Overview) option.

### Credentials

You can generate client credentials [following this steps](/docs/how-to-generate-client-credentials.md).

## :blue_book: Basic demo

With [this basic demo](/demos/app-service), we will create the following Azure resources:

- Resource Group
- App Service Plan
- App Service

### What can I learn?

#### Declare variables

```terraform
variable "azure_location" {
    type            = string
    default         = "West Europe"
}
```
#### Read variables

```terraform
var.azure_location
```

#### Create resource
```terraform
resource "azurerm_resource_group" "demo" {
  name     = var.azure_resource_group
  location = var.azure_location
}
```

#### Create dependant resource

```terraform
# resource group
resource "azurerm_resource_group" "demo" {
  name     = var.azure_resource_group
  location = var.azure_location
}

# service plan
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
```

Note that "service plan" resource populates `resource_group_name` with value of `azurerm_resource_group.demo.name`.

So, this causes that "service plan" resource depends on "resource group" resource.

Another way to establish resource dependency is add [depends_on](https://www.terraform.io/docs/configuration/resources.html#resource-dependencies) meta argument

#### Output variables

To capture data from resources created

```terraform
output "app_service_default_site_hostname" {
  value = azurerm_app_service.demo.default_site_hostname
}
```

```terraform
app_service_default_site_hostname = demo-terraform-app-service.azurewebsites.net
```

### Steps

First, [replace variables](#prepare-demos) with your own values.

Execute `terraform init` command to initialize working directory and then execute `terraform apply` to create resources.

Navigate to Azure Portal and validate that the resources exists.

Finally, execute `terraform destroy` command to delete this resources.

## :blue_book: Intermediate demo

With [this basic demo](/demos/server-database), we will create the following Azure resources:

- Resource Group
- SQL Server & Elastic Pool
  - 5 Azure SQL databases
- Firewall rule

### What can I learn?

#### Declare list variables

```terraform
variable "azure_sql_database_names" {
    type            = list(string)
    default         = ["one", "two", "three", "four", "five"]
}
```

#### Declare external data sources

With this data source we can declare a data source that capture the IP of host machine

```terraform
data "http" "current_ip" {
    url             = "http://ipv4.icanhazip.com"
}
```

And assign value like this:

```terraform
start_ip_address    = chomp(data.http.current_ip.body)
```

#### Iteration

```terraform
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
```

With `count` meta property we can define that the current resource specification will execute N times on Azure.

Note that the `name` property will be dynamic because multiple databases with the same name cannot exist.

### Steps

Execute `terraform init` command to initialize working directory and then execute `terraform apply` to create resources.

Navigate to Azure Portal and validate that the resources exists.

Finally, execute `terraform destroy` command to delete this resources.

## :blue_book: Advance demo

Pending...
