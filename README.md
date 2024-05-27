# Terraform AWS Modules Blueprint

## Description

<!-- INFO: A brief description of the blueprint -->

This repository serves as a blueprint for creating new Terraform modules tailored for AWS. It is designed to provide a structured and consistent foundation for developing modular infrastructure stacks.

## Overview

<!-- INFO: A brief overview of the blueprint features -->

Modules are organized within the `src/` directory. Each module consists of a `model/` and `wrapper/` directory. The `model/` directory contains the Terraform code specific to the module, while the `wrapper/` directory contains the Terraform code for the module's wrapper.

- **Module Structure:**
  - [Module](src/module-example-1/): The module's Terraform code. The module is used to create all logical components of the module.
  - [Module Model](src/module-example-1/model): The module's model Terraform code. The model is used to create a single instance of the module.
  - [Module Wrapper](src/module-example-1/wrapper): The module's wrapper Terraform code. The wrapper is used to create a multiple instances of the module.

## Usage

<!-- INFO: The steps to use the blueprint successfully -->

### Getting Started

1. Choose the desired module from the list.
2. Navigate to the respective directories to access the module and its components.

### Modules List

<!-- INFO: A list of available modules -->

- **`module-example-1`:**
  - [Module Example 1](src/module-example-1/)
  - [Module Example 1 Model](src/module-example-1/model)
  - [Module Example 1 Wrapper](src/module-example-1/wrapper)

## Examples

### Examples List

<!-- INFO: A list of available examples -->

- **`module-example-1`:**
  - [Module Example 1 Complete](src/module-example-1/examples/complete/)

## Documentation

<!-- INFO: Additional information about the blueprint -->

Explore detailed documentation to enhance your understanding:

- [Documentation](https://www.tf-docs.cirrusgo.com/docs/)
