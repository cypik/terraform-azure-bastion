# terraform-azure-bastion
# Terraform Azure Infrastructure

This Terraform configuration defines an Azure infrastructure using the Azure provider.

## Table of Contents

- [Introduction](#introduction)
- [Usage](#usage)
- [Module Inputs](#module-inputs)
- [Module Outputs](#module-outputs)
- [Examples](#examples)
- [License](#license)

## Introduction
This repository contains Terraform code to deploy resources on Microsoft Azure, including a resource group and a bastion host.

## Usage
To use this module, you should have Terraform installed and configured for AZURE. This module provides the necessary Terraform configuration
for creating AZURE resources, and you can customize the inputs as needed. Below is an example of how to use this module:

# Example

```hcl
module "bastion" {
  depends_on          = [module.resource_group]
  source              = "git::https://github.com/cypik/terraform-azure-bastion.git?ref=v1.0.0"
  name                = "app"
  environment         = "test"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  subnet_id           = module.name_specific_subnet.specific_subnet_id
}
```
This example demonstrates how to create various AZURE resources using the provided modules. Adjust the input values to suit your specific requirements.

## Module Inputs
The following input variables can be configured:

- 'name': Specifies the name of the Bastion Host.
- 'environment': The environment or purpose of the resources.
- 'location': Specifies the supported Azure location where the resource exists.
- 'resource_group_name': The name of the resource group in which to create the Bastion Host.
- 'subnet_id': Reference to a subnet in which this Bastion Host has been created.

## Module Outputs
This module provides the following outputs:

- 'bastion_id': The ID of the Bastion Host.
- 'bastion_dns_name': The FQDN for the Bastion Host.

# Examples
For detailed examples on how to use this module, please refer to the '[example](https://github.com/cypik/terraform-azure-bastion/blob/master/_example)' directory within this repository.

# License
This Terraform module is provided under the '[License Name]' License. Please see the [LICENSE](https://github.com/cypik/terraform-azure-bastion/blob/master/LICENSE) file for more details.

# Author
Your Name
Replace '[License Name]' and '[Your Name]' with the appropriate license and your information. Feel free to expand this README with additional details or usage instructions as needed for your specific use case.
