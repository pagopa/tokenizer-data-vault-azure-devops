# Pipeline tokenizer private data vault.

This repo allows you to create a Azure Devops project pipelines

## How to use this template

You need to create before in infra this resources:

# TODO

You need to add to the key vault at least this secrets:

* azure-devops-github-ro-TOKEN
* azure-devops-github-pr-TOKEN
* TODO

## Github bot

Use your github bot to generate the token to interact with your repo.

And don't forgot to associate to your repo as ADMIN, without this is impossibile to use the pipelines

## Change values in this files

Change the values in this files

### azure-devops/.env/prod-backend.ini

Put the name of your production subscription

### azure-devops/.env/terraform.tfvars

Change the project prefix and the names of your subscriptions

### azure-devops/.env/(app | iac)_state.tfvars

Change the information about the state, changed the `prefix` with the prefix of your project used into the infra project.
(e.g. selc or dvopla)

## terraform.sh

To be able to launch terraform scripts you can use the script called `terraform.sh`

To launch the app pipelines use

```sh
sh terraform.sh apply app
```

To launch the iac pipelines use

```sh
sh terraform.sh apply iac
```

## Precommit check

Check your code before commit.

<https://github.com/antonbabenko/pre-commit-terraform#how-to-install>

```sh
pre-commit run -a
```
