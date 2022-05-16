## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.10.0 |
| <a name="requirement_azuredevops"></a> [azuredevops](#requirement\_azuredevops) | = 0.1.8 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.10.0 |
| <a name="provider_aws.prod"></a> [aws.prod](#provider\_aws.prod) | ~> 4.10.0 |
| <a name="provider_azuredevops"></a> [azuredevops](#provider\_azuredevops) | = 0.1.8 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ecs_tokenizer_deploy"></a> [ecs\_tokenizer\_deploy](#module\_ecs\_tokenizer\_deploy) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_deploy?ref=v2.0.5 |  |
| <a name="module_template-pipeline-microservice_code_review"></a> [template-pipeline-microservice\_code\_review](#module\_template-pipeline-microservice\_code\_review) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_code_review?ref=v2.0.5 |  |

## Resources

| Name | Type |
|------|------|
| [azuredevops_project.this](https://registry.terraform.io/providers/microsoft/azuredevops/0.1.8/docs/resources/project) | resource |
| [azuredevops_project_features.features](https://registry.terraform.io/providers/microsoft/azuredevops/0.1.8/docs/resources/project_features) | resource |
| [azuredevops_serviceendpoint_aws.prod_serviceendpoint](https://registry.terraform.io/providers/microsoft/azuredevops/0.1.8/docs/resources/serviceendpoint_aws) | resource |
| [azuredevops_serviceendpoint_aws.uat_serviceendpoint](https://registry.terraform.io/providers/microsoft/azuredevops/0.1.8/docs/resources/serviceendpoint_aws) | resource |
| [azuredevops_serviceendpoint_github.github_pr](https://registry.terraform.io/providers/microsoft/azuredevops/0.1.8/docs/resources/serviceendpoint_github) | resource |
| [azuredevops_serviceendpoint_github.github_ro](https://registry.terraform.io/providers/microsoft/azuredevops/0.1.8/docs/resources/serviceendpoint_github) | resource |
| [aws_secretsmanager_secret.devops_prod](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret) | data source |
| [aws_secretsmanager_secret.devops_uat](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret) | data source |
| [aws_secretsmanager_secret_version.devops_prod](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret_version) | data source |
| [aws_secretsmanager_secret_version.devops_uat](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret_version) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ms-tokenizer"></a> [ms-tokenizer](#input\_ms-tokenizer) | git repo ms-person service | `map` | <pre>{<br>  "pipeline": {<br>    "enable_code_review": true,<br>    "enable_deploy": true<br>  },<br>  "repository": {<br>    "branch_name": "refs/heads/main",<br>    "name": "pdv-ms-tokenizer",<br>    "organization": "pagopa",<br>    "pipelines_path": ".devops",<br>    "yml_prefix_name": null<br>  }<br>}</pre> | no |
| <a name="input_project_description"></a> [project\_description](#input\_project\_description) | n/a | `string` | `"DevOps project for tokenizer data vault."` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Azure devops project name | `string` | `"tokenizer-data-vault-projects"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS default region | `string` | `"eu-south-1"` | no |
| <a name="input_sonarcloud"></a> [sonarcloud](#input\_sonarcloud) | # Sonar cloud | <pre>object({<br>    id                 = string<br>    organization       = string<br>    service_connection = string<br>    project_key        = string<br>  })</pre> | <pre>{<br>  "id": "0537c8f3-f2d2-43ce-a39d-64e9c511f95f",<br>  "organization": "pagopa",<br>  "project_key": "pagopa_pdv-ms-tokenizer",<br>  "service_connection": "SONARCLOUD-SERVICE-CONN"<br>}</pre> | no |

## Outputs

No outputs.
