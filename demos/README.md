# Demos

## Prepare demos

For all demos on this repository, ensure to modify the variables.tf file with the correct values:

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

You can find Subscription ID value on [Subscriptions blade option](https://portal.azure.com/#blade/Microsoft_Azure_Billing/SubscriptionsBlade)

![Subscriptions](/images/subscription.PNG)

### Tenant ID

You can find Tenant ID value by clicking on "Directory + Subscription" option on the top of the Azure Portal.

![Subscriptions](/images/tenant.PNG)

### Credentials

You can generate client credentials [following this steps](/docs/how-to-generate-client-credentials.md).

## :computer: Basic

With [this demo](/demos/app-service), we will create the following Azure resources:

- Resource Group
- App Service Plan
- App Service

### Steps

First, [replace variables](#prepare-demos) with your own values.

Execute `terraform init` command to initialize working directory and then execute `terraform apply` to create resources.

Navigate to Azure Portal and validate that the resources exists.

Finally, execute `terraform destroy` command to delete this resources.

## :computer: Intermediate

Pending...

## :computer: Advance

Pending...
