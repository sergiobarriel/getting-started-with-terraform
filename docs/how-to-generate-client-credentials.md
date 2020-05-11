# How to generate client credentials for Terraform authentication

## Domain application

Inside your organization, on your [Azure Active Directory](https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Overview) you need to register an application

![register an application](/images/my-organization-app-registrations.PNG)

You can set the application name, supported accounts and platform configuration as following screeenshot:

![register an application](/images/register-an-application.PNG)

## Credentials

The next step is generate a new secret for this application over "certificates & secrets" option. 

Choose the expiration date that you consider.

For future steps you need to copy the secret (on secure place)

![new secret](/images/add-a-new-client-secret.PNG)

## Your application

Now your application is ready.

For future steps you need to copy the "Application (client) ID" value

![new secret](/images/my-application.PNG)

## Assign permissions to application

Until you doesn't assign appropriate permissions, you can't use this application.

For fix this, you can choose assign permissions over subscription or over specific resource group (for example)

On anyway, you need to navigate to IAM option, and assign role "Contributor" to application.

![new secret](/images/add-role-assignment.PNG)

![new secret](/images/my-subscription-iam.PNG)

## Another guide

All these steps are perfectly detailed on [Terraform documentation](https://www.terraform.io/docs/providers/azurerm/guides/service_principal_client_secret.html)