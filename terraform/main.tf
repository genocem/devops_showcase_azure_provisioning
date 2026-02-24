
provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

resource "azurerm_resource_group" "res_group_jenkins" {
  name     = "jenkinsNew"
  location = "France Central"
}


module "jenkins_vm" {
  source                = "./modules/jenkins_vm"
  location              = azurerm_resource_group.res_group_jenkins.location
  resource_group_name   = azurerm_resource_group.res_group_jenkins.name
  private_key_file_path = "~/.ssh/id_rsa"
  public_key_file_path  = "~/.ssh/id_rsa.pub"
  vm_type               = "Standard_B2als_v2"
  ssh_enabled           = var.ssh_enabled
  acr_username = module.acr_module.acr_username
  acr_password = module.acr_module.acr_password
}

#for stronger machine we can use Standard_D2s_v3 or smth else


module "akscluster" {
  source              = "./modules/aks_cluster"
  location            = azurerm_resource_group.res_group_jenkins.location
  resource_group_name = azurerm_resource_group.res_group_jenkins.name
  acr_id              = module.acr_module.acr_id
}



module "acr_module" {
  source              = "./modules/acr_module"
  acr_name            = "stageMicroservices"
  location            = azurerm_resource_group.res_group_jenkins.location
  resource_group_name = azurerm_resource_group.res_group_jenkins.name
}

output "kube_config" {
  value     = module.akscluster.kube_config
  sensitive = true
}
