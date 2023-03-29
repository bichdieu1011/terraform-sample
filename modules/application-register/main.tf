resource "azuread_application" "terraformtest" {
  display_name = "terraform-web-v5"
  sign_in_audience = "AzureADandPersonalMicrosoftAccount"
  
  api{
    requested_access_token_version = 2 
  }

  
}
