resource "terraform_storage" "terraform_files" {
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