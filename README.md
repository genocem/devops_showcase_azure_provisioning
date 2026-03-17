# Azure Provisioning

Terraform and Ansible automation for Azure infrastructure: VM provisioning, Jenkins setup with Docker, and CI/CD pipeline configuration.


## Components

- Terraform - Azure VM provisioning
- Ansible - Configuration management
  - Docker installation
  - Jenkins container setup
  - Plugin installation
  - Pipeline configuration

## Infrastructure Diagram

<!-- TODO: Add diagram showing Terraform modules and resource relationships -->

## Prerequisites

- Terraform installed
- Ansible installed
- Azure CLI authenticated (`az login`)
- SSH keys at `~/.ssh/id_rsa` and `~/.ssh/id_rsa.pub`
- Ansible vault with secrets in `ansible/secrets.yaml`
- Vault password file at `ansible/.vault_pass`

## Required Secrets

Create vault file:
```bash
ansible-vault create ansible/secrets.yaml
```

Required variables:
- `jenkins_account_username`
- `jenkins_account_password`
- `gitlab_stageDevops_commercial_token`
- `gitlab_reclamation_token`

Edit secrets:
```bash
ansible-vault edit ansible/secrets.yaml --vault-password-file ansible/.vault_pass
```

## Usage

```bash
cd terraform
terraform init
terraform apply
# Set ssh_enabled variable to run Ansible configuration
# Ansible runs automatically after VM creation
```

Access Jenkins at `http://<VM_IP>:8080`

## Terraform Modules

| Module | Purpose |
|--------|---------|
| acr_module | Azure Container Registry |
| aks_cluster | Azure Kubernetes Service |
| jenkins_vm | Jenkins VM provisioning |

## Ansible Roles

| Role | Purpose |
|------|---------|
| docker_setup | Docker installation |
| jenkins_container_setup | Jenkins container deployment |
| jenkins_plugins | Plugin installation |
| jenkins_add_pipelines | Pipeline configuration |

## Deployment Flow Diagram

<!-- TODO: Add diagram showing the deployment flow from Terraform to Ansible -->

## License

MIT License
