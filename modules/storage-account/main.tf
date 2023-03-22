resource "azurerm_storage_account" "terraform_files" {
  name                     = "terraformstoredfiles"
  resource_group_name      = var.resource_group
  location                 = var.deploy_location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type

  tags = {
    environment = var.environment
    department = var.department
    source  = var.app_source
  }
}

resource "azurerm_storage_container" "terraform_files" {
  name                  = "terraformcontainer"
  storage_account_name  = azurerm_storage_account.terraform_files.name
  container_access_type = "private"
}