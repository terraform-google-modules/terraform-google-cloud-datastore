# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

Extending the adopted spec, each change should have a link to its corresponding pull request appended.

## [2.0.1](https://github.com/terraform-google-modules/terraform-google-cloud-datastore/compare/v2.0.0...v2.0.1) (2024-01-03)


### Bug Fixes

* upgraded versions.tf to include minor bumps from tpg v5 ([#41](https://github.com/terraform-google-modules/terraform-google-cloud-datastore/issues/41)) ([3ed7ac8](https://github.com/terraform-google-modules/terraform-google-cloud-datastore/commit/3ed7ac89552dc9dc067b53a0e506405f3f0fdd53))

## [2.0.0](https://github.com/terraform-google-modules/terraform-google-cloud-datastore/compare/v1.0.0...v2.0.0) (2022-05-06)


### ⚠ BREAKING CHANGES

* add Terraform 0.13 constraint and module attribution (#25)

### Features

* add Terraform 0.13 constraint and module attribution ([#25](https://github.com/terraform-google-modules/terraform-google-cloud-datastore/issues/25)) ([6dc3662](https://github.com/terraform-google-modules/terraform-google-cloud-datastore/commit/6dc3662146995c1d60066138665c8bd1ae9d022b))
* update TPG version constraints to allow 4.0 ([#27](https://github.com/terraform-google-modules/terraform-google-cloud-datastore/issues/27)) ([4412468](https://github.com/terraform-google-modules/terraform-google-cloud-datastore/commit/441246861e1e67e6f4d2206b53c178a369a272d3))

## [Unreleased]

### Removed

- The `credentials` variable. Credentials for the scripts are retrieved from the `GOOGLE_APPLICATION_CREDENTIALS` environment
  variable. [#16]

## [1.0.0] - 2019-09-06

### Changed

- Supported version of Terraform is 0.12. [#12]

## [0.2.0] - 2019-02-21
### CHANGED
- Converted test coverage to use kitchen-terraform. [#3](https://github.com/terraform-google-modules/terraform-google-cloud-datastore/pull/3)

### ADDED
- Added test coverage for outputs. [#5](https://github.com/terraform-google-modules/terraform-google-cloud-datastore/pull/5)

### FIXED
- Hook to update indexes on changes. [#6](https://github.com/terraform-google-modules/terraform-google-cloud-datastore/pull/6)

## [0.1.0] - 2018-09-14
### ADDED
- This is the initial release of the Project Factory Module.

[Unreleased]: https://github.com/terraform-google-modules/terraform-google-cloud-datastore/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/terraform-google-modules/terraform-google-cloud-datastore/compare/v0.2.0...v1.0.0
[0.2.0]: https://github.com/terraform-google-modules/terraform-google-cloud-datastore/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/terraform-google-modules/terraform-google-cloud-datastore/compare/eba169975e2038f3e721b8a6c5f67c2330998b37...v0.1.0
[#16]: https://github.com/terraform-google-modules/terraform-google-cloud-datastore/pull/16
[#12]: https://github.com/terraform-google-modules/terraform-google-cloud-datastore/pull/12
