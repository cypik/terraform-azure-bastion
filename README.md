# Terraform-azure-bastion

# Terraform Azure Cloud Bastion Module

## Table of Contents
- [Introduction](#introduction)
- [Usage](#usage)
- [Examples](#examples)
- [Author](#author)
- [License](#license)
- [Inputs](#inputs)
- [Outputs](#outputs)

## Introduction
This repository contains Terraform code to deploy resources on Microsoft Azure, including a resource group and a bastion host.

## Usage
To use this module, you should have Terraform installed and configured for AZURE. This module provides the necessary Terraform configuration
for creating AZURE resources, and you can customize the inputs as needed. Below is an example of how to use this module:

# Example

```hcl
module "bastion" {
  depends_on          = [module.resource_group]
  source              = "cypik/bastion/azure"
  version              = "1.0.1"
  name                = "app"
  environment         = "test"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  subnet_id           = module.name_specific_subnet.specific_subnet_id
}
```
This example demonstrates how to create various AZURE resources using the provided modules. Adjust the input values to suit your specific requirements.

# Examples
For detailed examples on how to use this module, please refer to the [example](https://github.com/cypik/terraform-azure-bastion/blob/master/_example) directory within this repository.

# License
This Terraform module is provided under the **MIT** License. Please see the [LICENSE](https://github.com/cypik/terraform-azure-bastion/blob/master/LICENSE) file for more details.

# Author
Your Name
Replace **MIT** and **Cypik** with the appropriate license and your information. Feel free to expand this README with additional details or usage instructions as needed for your specific use case.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.6 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.87.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >=3.87.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_labels"></a> [labels](#module\_labels) | cypik/labels/azure | 1.0.1 |

## Resources

| Name | Type |
|------|------|
| [azurerm_bastion_host.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/bastion_host) | resource |
| [azurerm_public_ip.pip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bastion_host_sku"></a> [bastion\_host\_sku](#input\_bastion\_host\_sku) | The SKU of the Bastion Host. Accepted values are `Basic` and `Standard` | `string` | `"Basic"` | no |
| <a name="input_ddos_protection_mode"></a> [ddos\_protection\_mode](#input\_ddos\_protection\_mode) | The DDoS protection mode of the public IP | `string` | `"VirtualNetworkInherited"` | no |
| <a name="input_enable_copy_paste"></a> [enable\_copy\_paste](#input\_enable\_copy\_paste) | Is Copy/Paste feature enabled for the Bastion Host? | `bool` | `true` | no |
| <a name="input_enable_file_copy"></a> [enable\_file\_copy](#input\_enable\_file\_copy) | Is File Copy feature enabled for the Bastion Host. Only supported whne `sku` is `Standard` | `bool` | `false` | no |
| <a name="input_enable_ip_connect"></a> [enable\_ip\_connect](#input\_enable\_ip\_connect) | Is IP Connect feature enabled for the Bastion Host? | `bool` | `false` | no |
| <a name="input_enable_shareable_link"></a> [enable\_shareable\_link](#input\_enable\_shareable\_link) | Is Shareable Link feature enabled for the Bastion Host. Only supported whne `sku` is `Standard` | `bool` | `false` | no |
| <a name="input_enable_tunneling"></a> [enable\_tunneling](#input\_enable\_tunneling) | Is Tunneling feature enabled for the Bastion Host. Only supported whne `sku` is `Standard` | `bool` | `false` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Set to false to prevent the module from creating any resources. | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | Label order, e.g. sequence of application name and environment `name`,`environment`,'attribute' [`webserver`,`qa`,`devops`,`public`,] . | `list(any)` | <pre>[<br>  "name",<br>  "environment"<br>]</pre> | no |
| <a name="input_location"></a> [location](#input\_location) | A location the resources | `string` | `""` | no |
| <a name="input_managedby"></a> [managedby](#input\_managedby) | ManagedBy, eg 'cypik'. | `string` | `"cypik"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name  (e.g. `app` or `cluster`). | `string` | `""` | no |
| <a name="input_public_ip_allocation_method"></a> [public\_ip\_allocation\_method](#input\_public\_ip\_allocation\_method) | Defines the allocation method for this IP address. Possible values are Static or Dynamic | `string` | `"Static"` | no |
| <a name="input_public_ip_sku"></a> [public\_ip\_sku](#input\_public\_ip\_sku) | The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic | `string` | `"Standard"` | no |
| <a name="input_repository"></a> [repository](#input\_repository) | Terraform current module repo | `string` | `"https://github.com/cypik/terraform-azure-bastion"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | A container that holds related resources for an Azure solution | `string` | `""` | no |
| <a name="input_scale_units"></a> [scale\_units](#input\_scale\_units) | The number of scale units with which to provision the Bastion Host. Possible values are between `2` and `50`. `scale_units` only can be changed when `sku` is `Standard`. `scale_units` is always `2` when `sku` is `Basic`. | `number` | `2` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The ID of the Subnet where this Network Interface should be located in. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dns_name"></a> [dns\_name](#output\_dns\_name) | Specifies the name of the bastion host |
| <a name="output_id"></a> [id](#output\_id) | Specifies the resource id of the bastion host |
<!-- END_TF_DOCS -->