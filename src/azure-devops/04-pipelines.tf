locals {
  ms_tokenizer_app = {
    docker_image = "ms-tokenizer"
  }
}


# MS tokenizer
module "ecs_tokenizer_deploy" {
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_deploy?ref=v2.0.5"

  project_id                   = azuredevops_project.this.id
  repository                   = var.ms-tokenizer.repository
  github_service_connection_id = azuredevops_serviceendpoint_github.github_pr.id

  ci_trigger_use_yaml = true

  variables        = local.ms_tokenizer_app
  variables_secret = {}

  service_connection_ids_authorization = [
    azuredevops_serviceendpoint_github.github_ro.id,
    azuredevops_serviceendpoint_aws.uat_serviceendpoint.id,
    azuredevops_serviceendpoint_aws.prod_serviceendpoint.id,
  ]
}

## Code review
module "template-pipeline-microservice_code_review" {
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_code_review?ref=v2.0.5"

  project_id                   = azuredevops_project.this.id
  repository                   = var.ms-tokenizer.repository
  github_service_connection_id = azuredevops_serviceendpoint_github.github_pr.id

  pull_request_trigger_use_yaml = true

  variables = {
    sonarcloud_service_conn = var.sonarcloud.service_connection
    sonarcloud_org          = var.sonarcloud.organization
    sonarcloud_project_key  = var.sonarcloud.project_key
    sonarcloud_project_name = join("_", [
      var.sonarcloud.organization, var.sonarcloud.project_key
    ])
  }

  variables_secret = {}

  service_connection_ids_authorization = [
    azuredevops_serviceendpoint_github.github_ro.id,
    var.sonarcloud.id,
  ]
}