
locals {
  tags = {
    environment = var.environment
    department = var.department
    source = var.app_source
  }
  app_settings = {
    APPLICATIONINSIGHTS_CONNECTION_STRING = var.application_insight_connection_string
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


  auth_settings_v2 {
    auth_enabled = true
    require_authentication = true
    unauthenticated_action = "RedirectToLoginPage"
    
    login {
    }

    active_directory_v2  {
      client_id = var.client_id
      tenant_auth_endpoint = "https://login.microsoftonline.com/common/v2.0"
      client_secret_setting_name = "MICROSOFT_PROVIDER_AUTHENTICATION_SECRET"
    }
  }

}