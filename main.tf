# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.48.0"
    }
  }

  required_version = ">= 1.1.0"

  backend "azurerm" {
    resource_group_name = "terrformState"
    storage_account_name = "terraformstatebich"
    container_name = "tfstate"
    key = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}


module "resource-group" {
  source          = "./modules/resource-group"
  resource_group  = var.resource_group
  deploy_location = var.deploy_location
}

module "webapplication" {
  source          = "./modules/web-application"
  resource_group  = var.resource_group
  deploy_location = var.deploy_location
  environment     = var.environment
  department      = var.department
  app_source      = var.app_source
  depends_on      = [module.resource-group]
}

module "storagAccount" {
  source          = "./modules/storage-account"
  resource_group  = var.resource_group
  deploy_location = var.deploy_location
  environment     = var.environment
  department      = var.department
  app_source      = var.app_source  
  storage_account_replication_type = var.storage_account_replication_type
  storage_account_tier = var.storage_account_tier
  depends_on      = [module.resource-group]
}