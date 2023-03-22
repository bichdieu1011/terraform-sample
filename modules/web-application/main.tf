
locals {
  tags = {
    environment = var.environment
    department = var.department
    source = var.app_source
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
  site_config {
  }

}