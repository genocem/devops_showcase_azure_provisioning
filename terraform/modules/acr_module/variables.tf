variable "acr_name" {
  type = string
}

variable "location" {
  description = "The Azure region to deploy resources in"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}


# variable "jenkins_machine_principle_id" {
#   type= string
# }