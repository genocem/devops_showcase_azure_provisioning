resource "azurerm_kubernetes_cluster" "akscluster" {
  name                = "aks1"
  resource_group_name = var.resource_group_name
  location            = var.location
  dns_prefix          = "prefixaks1"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_B2als_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}
resource "azurerm_role_assignment" "aks_acr_pull" {
  scope                = var.acr_id
  role_definition_name = "AcrPull"
  principal_id = azurerm_kubernetes_cluster.akscluster.kubelet_identity[0].object_id
}


