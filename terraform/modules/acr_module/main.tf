resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = true
}

# resource "azurerm_role_assignment" "acr_push" {
#   principal_id         = var.jenkins_machine_principle_id
#   role_definition_name = "AcrPush"
#   scope                = azurerm_container_registry.acr.id
# }

# turns out i can make the jenkins container be able to directly call acr so 
# no need for all of this anymore


# resource "azuread_application" "acr_app" {
#   display_name = "${var.acr_name}-sp"
# }

# resource "azuread_service_principal" "acr_sp" {
#   client_id = azuread_application.acr_app.client_id// client id required ?
# }

# resource "azuread_service_principal_password" "acr_sp_secret" {
#   service_principal_id = azuread_service_principal.acr_sp.id
# }

# resource "azurerm_role_assignment" "acr_push" {
#   principal_id         = azuread_service_principal.acr_sp.id
#   role_definition_name = "AcrPush"
#   scope                = azurerm_container_registry.acr.id
# }