resource "azurerm_resource_group" "asiarg" {
  name     = var.resource_group
  location = var.deploy_location
}
