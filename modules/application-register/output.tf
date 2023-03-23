
output "client_id" {
  description = "ID of the resource group"
  value       = azuread_application.terraformtest.application_id
}
