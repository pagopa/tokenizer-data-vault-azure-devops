variable "region" {
  type        = string
  description = "AWS default region"
  default     = "eu-south-1"
}

variable "project_name" {
  type        = string
  default     = "tokenizer-data-vault-projects"
  description = "Azure devops project name"
}

variable "project_description" {
  type    = string
  default = "DevOps project for tokenizer data vault."
}

# git repo ms-person service
variable "ms-tokenizer" {
  default = {
    repository = {
      organization    = "pagopa"
      name            = "pdv-ms-tokenizer"
      branch_name     = "refs/heads/main"
      pipelines_path  = ".devops"
      yml_prefix_name = null
    }
    pipeline = {
      enable_code_review = true
      enable_deploy      = true
    }
  }
}

## Sonar cloud
variable "sonarcloud" {
  type = object({
    id                 = string
    organization       = string
    service_connection = string
    project_key        = string
  })
  default = {
    id                 = "0537c8f3-f2d2-43ce-a39d-64e9c511f95f"
    organization       = "pagopa"
    service_connection = "SONARCLOUD-SERVICE-CONN"
    project_key        = "pagopa_pdv-ms-tokenizer"
  }
}
