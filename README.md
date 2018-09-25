# Module for Google Cloud Datastore

This modules helps you to manage [Google Cloud Datastore](https://cloud.google.com/datastore/docs/).

Currently, it supports **index creation** by shelling out to gcloud.

## Usage

```
module "datastore" {
  source      = "../"
  credentials = "sa-key.json"
  project     = "my-project-id"
  indexes     = "${file("index.yaml")}"
}
```

### Module Inputs

Argument Reference:

- source: Path to the module's folder
- credentials: File path of a service account with access to managing Datastore.
- project: The project id to manage datastore indexes for.
- indexes: The contents of an [index file](https://cloud.google.com/datastore/docs/tools/indexconfig#Datastore_About_index_yaml).
  This can be extracted from a file on disk using "${file(var.index_file_path)}"

[^]: (autogen_docs_start)


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| credentials | Service account json auth path | string | - | yes |
| indexes | The contents of a index.yaml file, to apply indexes from | string | - | yes |
| project | The project id | string | - | yes |

[^]: (autogen_docs_end)

## Development

### Requirements
- [bundler](https://github.com/bundler/bundler)
- [gcloud beta](https://cloud.google.com/sdk/install)
- [jq](https://stedolan.github.io/jq/) 1.5
- [terraform-docs](https://github.com/segmentio/terraform-docs/releases) 0.3.0

### Autogeneration of documentation from .tf files
Run
```
make generate_docs
```

### Integration test
#### Terraform integration tests
The integration tests for this module leverage [kitchen-terraform](https://github.com/newcontext-oss/kitchen-terraform) and [kitchen-inspec](https://github.com/inspec/kitchen-inspec).

The tests will do the following:
- Perform `bundle install` command
  - Installs `kitchen-terraform` and `kitchen-inspec` gems
- Perform `kitchen create` command
  - Performs a `terraform init`
- Perform `kitchen converge` command
  - Performs a `terraform apply -auto-approve`
- Perform `kitchen validate` command
  - Performs inspec tests.
    - Inspec tests shell out to gcloud to validate expected resources in GCP.
- Permos `kitchen destroy` command
  - Performs a `terraform destroy -force`

You can use the following command to run the integration test in the root folder

  `make test_integration`

### Linting
The makefile in this project will lint or sometimes just format any shell,
Python, golang, Terraform, or Dockerfiles. The linters will only be run if
the makefile finds files with the appropriate file extension.

All of the linter checks are in the default make target, so you just have to
run

```
make -s
```

The -s is for 'silent'. Successful output looks like this

```
Running shellcheck
Running flake8
Running gofmt
Running terraform validate
Running hadolint on Dockerfiles
Test passed - Verified all file Apache 2 headers
```

The linters
are as follows:
* Shell - shellcheck. Can be found in homebrew
* Python - flake8. Can be installed with 'pip install flake8'
* Golang - gofmt. gofmt comes with the standard golang installation. golang
is a compiled language so there is no standard linter.
* Terraform - terraform has a built-in linter in the 'terraform validate'
command.
* Dockerfiles - hadolint. Can be found in homebrew