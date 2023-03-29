
locals {
  tags = {
    environment = var.environment
    department = var.department
    source = var.app_source
  }
  app_settings = {
    APPLICATIONINSIGHTS_CONNECTION_STRING = var.application_insight_connection_string
     
    WEBSITE_NODE_DEFAULT_VERSION = "12.16.1"
    AAD_ENABLED                  = "true"
    AAD_CLIENT_ID                = var.client_id
    AAD_ISSUER_URL               = "https://login.microsoftonline.com/common/v2.0"
    AAD_METADATA_URL             = "https://login.microsoftonline.com/common/v2.0/.well-known/openid-configuration"
    AAD_REDIRECT_URI             = "https://terraform-web-service.azurewebsites.net/.auth/login/aad/callback"
    AAD_SCOPES                   = "openid profile email"
    # WEBSITE_AUTH_DEFAULT_PROVIDER= "AzureActiveDirectory"
  
  }
  
}


resource "azurerm_service_plan" "teraformwebservice" {
  name                = "teraformwebserviceplan"
  resource_group_name = var.resource_group
  location            = var.deploy_location
  os_type             = "Linux"
  sku_name            = "P1v2"
}


resource "azurerm_windows_web_app" "teraformwebservice" {
  name                = "terraform-web-service"
  location            = var.deploy_location
  resource_group_name = var.resource_group
  service_plan_id     = azurerm_service_plan.teraformwebservice.id
  tags                = local.tags
  https_only          = false
  site_config {
  }

  app_settings =    local.app_settings
}