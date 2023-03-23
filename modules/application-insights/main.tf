resource "azurerm_application_insights" "terraformtest" {
  name                = "tf-test-appinsights"
  location            = var.deploy_location
  resource_group_name = var.resource_group
  application_type    = "web"
}