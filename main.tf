terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.97.1"
    }
  }
}

# Resource group
resource "azurerm_resource_group" "dev_ops01" {
  name        = "dev010-Rg"
  location    = "swedencentral"
}

resource "azurerm_storage_account" "storage010" {
  name                     = "devstorage010"
  resource_group_name       = azurerm_resource_group.dev_ops01.name
  location                  = azurerm_resource_group.dev_ops01.location
  account_tier              = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_mssql_server" "devmssql010" {
  name                     = "mssql-server010"
  resource_group_name       = azurerm_resource_group.dev_ops01.name
  location                  = azurerm_resource_group.dev_ops01.location
  version                   = "12.0"
  administrator_login       = "adminuser"
  administrator_login_password = "admin###2024" # Consider using a more secure way to store password
}

resource "azurerm_mssql_database" "example" {
  name                     = "example-db"
  server_id                 = azurerm_mssql_server.devmssql010.id
  collation                 = "SQL_Latin1_General_CP1_CI_AS"
  max_size_gb               = 4
  min_capacity              = 0.5
  auto_pause_delay_in_minutes = 60
  zone_redundant            = true
}

data "azurerm_mssql_database" "devmssalDb010" {
  name                     = azurerm_mssql_database.example.name
  server_id                 = azurerm_mssql_server.devmssql010.id
}

output "database_id" {
  value = data.azurerm_mssql_database.devmssalDb010.id
}

resource "azurerm_data_factory" "AdataF010" {
  name                     = "devAdf010"
  location                  = azurerm_resource_group.dev_ops01.location
  resource_group_name       = azurerm_resource_group.dev_ops01.name
}

resource "azurerm_key_vault" "keyharr01" {
  name                        = "devkeyV010"
  location                    = azurerm_resource_group.dev_ops01.location
  resource_group_name         = azurerm_resource_group.dev_ops01.name
  enabled_for_disk_encryption = true
  tenant_id                   = "##################"  # Replace with the appropriate interpolation or reference
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  sku_name                    = "standard"
}

resource "azurerm_key_vault_access_policy" "SP" {
  key_vault_id       = azurerm_key_vault.keyharr01.id
  tenant_id          = "####################"
  object_id          = "########################"
  key_permissions    = ["Get", "Create", "List", "Restore", "Recover", "UnwrapKey", "WrapKey", "Purge", "Encrypt", "Decrypt", "Sign", "Verify"]
  secret_permissions = ["Get", "Delete", "List"]
}

resource "azurerm_key_vault_access_policy" "SPuser" {
  key_vault_id       = azurerm_key_vault.keyharr01.id
  tenant_id          = "########################"
  object_id          = "#######################"
  key_permissions    = ["Get", "Create", "List", "Restore", "Recover", "UnwrapKey", "WrapKey", "Purge", "Encrypt", "Decrypt", "Sign", "Verify"]
  secret_permissions = ["Get", "Delete", "List", "Set"]
}


