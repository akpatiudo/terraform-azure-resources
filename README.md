# Title: Provisioning Azure Resources with Terraform and Visual Studio Code: A Comprehensive Guide

![image](https://github.com/akpatiudo/terraform-azure-resources/assets/118566096/a468fafe-82db-4ea4-8028-d1ca1f7f5a85)


## Introduction:
In the era of cloud computing, provisioning and managing infrastructure resources efficiently is crucial for businesses to achieve scalability, reliability, and cost-effectiveness. Microsoft Azure, one of the leading cloud service providers, offers a wide range of services to cater to various needs, from storage and databases to machine learning and artificial intelligence. Terraform, an open-source infrastructure as code (IaC) tool, simplifies the process of provisioning and managing Azure resources by enabling users to define infrastructure configurations in declarative code.

In this comprehensive guide, we will explore how to provision key Azure resources such as Azure Data Factory, Key Vault, Azure MMSSQL Server, Azure Storage, MSSQL Database, and Service Principals using Terraform and Visual Studio Code (VSC). We will walk through the step-by-step process of setting up your development environment, writing Terraform configurations, and deploying resources to the Azure cloud.

## Step-by-Step Guide:

## Setting up the Development Environment:

Install Visual Studio Code (VSC) and the Terraform extension.

Install the Azure CLI and log in to your Azure account using the CLI.

Create a new directory for your Terraform project in VSC.

## Defining Terraform Configuration Files:

Create *azure-provider.tf* file, herein define the provider credentials to connect with azure porters

Create a *main.tf* file to define the main Terraform configuration and resource blocks for each Azure service you want to provision.

Configure authentication credentials for Azure using service principals or managed identities. Caution! do not expose your credentials 

## Provisioning Azure Data Factory:

Define the Azure Data Factory resource block in your Terraform configuration.

Specify the necessary properties such as name, location, and resource group.

Configure additional settings such as linked services and datasets. (this was not capture in this project, it was done manually at azure porter in another project)

## Provisioning Azure Data Factory:

Define the Azure Data Factory resource block in your Terraform configuration.

Specify the necessary properties such as name, location, and resource group.


## Provisioning Azure Key Vault:

Define the Azure Key Vault resource block in your Terraform configuration.

Specify properties such as name, location, and resource group.

## Provisioning Azure SQL Server and Database:

Define the Azure SQL Server and Database resource blocks in your Terraform configuration.

Specify properties such as server name, location, and resource group.

Configure firewall rules to control access to the SQL Server. (this was not capture in this project, it was done manually at azure porter in another project)

## Provisioning Azure Storage:

Define the Azure Storage resource block in your Terraform configuration.

Specify properties such as account name, location, and resource group.

## Provisioning Service Principals:

Define the Service Principal resource block in your Terraform configuration.

Specify properties such as name, role assignments, and scopes.

Generate client ID and client secret for authentication. Caution! do not expose your credentials 

## Deploying Resources to Azure:

Initialize the Terraform project using terraform init command.

Plan the deployment using terraform plan command to preview changes.

![image](https://github.com/akpatiudo/terraform-azure-resources/assets/118566096/2b6bf19f-7e6f-40b6-964a-cb3ddf9447e7)


Apply the changes using terraform apply command to provision resources in Azure.

![image](https://github.com/akpatiudo/terraform-azure-resources/assets/118566096/c4c75a45-1d23-4943-a73c-a8bf0c6337d7)


## Summary:
In this guide, we have demonstrated how to provision essential Azure resources using Terraform and Visual Studio Code. By leveraging infrastructure as code principles, developers and DevOps engineers can automate the deployment and management of Azure resources, leading to improved efficiency, consistency, and scalability in cloud environments. With Terraform's declarative syntax and VSC's powerful IDE capabilities, provisioning Azure resources becomes a streamlined and manageable process for teams of any size.
