# Module for Google Cloud Datastore

This modules helps you to manage [Google Cloud Datastore](https://cloud.google.com/datastore/docs/).

Currently, it supports **index creation** by shelling out to gcloud.

## Compatibility

This module is meant for use with Terraform 0.12. If you haven't [upgraded](https://www.terraform.io/upgrade-guides/0-12.html) and need a Terraform 0.11.x-compatible version of this module, the last released version intended for Terraform 0.11.x
is [0.2.0](https://registry.terraform.io/modules/terraform-google-modules/cloud-datastore/google/0.2.0).

## Usage

```
module "datastore" {
  source      = "terraform-google-modules/cloud-datastore/google"
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

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| credentials | Service account json auth path | string | n/a | yes |
| indexes | The contents of a index.yaml file, to apply indexes from | string | n/a | yes |
| project | The project id | string | n/a | yes |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK --> 

## Development

### Requirements
- [docker](https://docs.docker.com/install/)
- [terraform-docs](https://github.com/segmentio/terraform-docs/releases) 0.3.0

### Autogeneration of documentation from .tf files
Run
```
make generate_docs
```

### Integration test
#### Terraform integration tests
The integration tests for this module leverage [kitchen-terraform](https://github.com/newcontext-oss/kitchen-terraform) and [kitchen-inspec](https://github.com/inspec/kitchen-inspec). For your convenience, a Docker container is included with all dependencies pre-installed. You can load it like this:

```
make docker_build_terraform
make docker_build_kitchen_terraform
make docker_run
```

To run the integration tests, you first need to set a few environment variables. These are defined in [sample.sh](./test/fixtures/sample.sh).

```
cp ./test/fixtures/sample.sh ./mine.sh
vi mine.sh
```

The tests can then be executed using the following commands:

1. `source mine.sh` to load in your environment variables (or set them directly).
2. Run `kitchen create` to initialize
  - This performs a `terraform init` on the [test fixture](./test/fixtures/)
3. Run `kitchen converge` to create the test infrastructure
  - This performs a `terraform apply -auto-approve` command
4. Run `kitchen verify` to execute the tests.
  - This command executes a series of inspec tests which shell out to gcloud to verify the underlying resources were created correctly.
5. Run `kitchen destroy` to clean up the test infrastructure.

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
