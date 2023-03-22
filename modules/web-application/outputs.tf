output "service_plan_id" {
  description = "ID of the VPC"
  value       = azurerm_service_plan.teraformwebservice.id
}

output "app_service_id" {
  description = "ID of the VPC"
  value       = azurerm_windows_web_app.teraformwebservice.id
}