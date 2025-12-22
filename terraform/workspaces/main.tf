terraform {
    required_version = "1.5.7"
}

resource "null_resource" "null" {
    triggers = {
        workspace = terraform.workspace
        timestamp = timestamp()
    }
}

output "current_workspace" {
    value = terraform.workspace
}

output "marker_id" {
    value = null_resource.null.id
}

variable instance_size_by_env {
  type        = map(string)
  default     = {
    dev     = "t3.micro"
    staging = "t3.small"
    prod    = "t3.medium"
  }
  description = "ec2 instance sizes for different environments"
}


output "ec2_instance_type" {
  description = "The EC2 instance type based on the current workspace"
  value       = var.instance_size_by_env[terraform.workspace]
}


#COMMANDs
# terraform workspace new dev
# terraform workspace new staging
# terraform workspace new prod
# terraform workspace list
# terraform init
# terraform plan -out=tfplan
# terraform apply tfplan
# terraform workspace select dev