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
    container_name = "tfcontainer"
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

module "applicationinsights" {
  source          = "./modules/application-insights"
  resource_group  = var.resource_group
  deploy_location = var.deploy_location
  depends_on      = [module.resource-group]
}

module "app_register"{
  source = "./modules/application-register"  
  depends_on      = [module.resource-group]
}

module "webapplication" {
  source          = "./modules/web-application"
  resource_group  = var.resource_group
  deploy_location = var.deploy_location
  environment     = var.environment
  department      = var.department
  app_source      = var.app_source
  client_id = module.app_register.client_id
  application_insight_connection_string = module.applicationinsights.connection_string
  depends_on      = [module.resource-group,  module.applicationinsights, module.app_register]
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