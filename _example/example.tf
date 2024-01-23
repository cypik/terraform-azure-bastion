provider "azurerm" {
  skip_provider_registration = "true"
  features {}
}

module "resource_group" {
  source      = "cypik/resource-group/azure"
  version     = "1.0.1"
  name        = "app"
  environment = "tested"
  location    = "North Europe"
}

module "vnet" {
  source              = "cypik/vnet/azure"
  version             = "1.0.1"
  name                = "app"
  environment         = "test"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  address_space       = "10.0.0.0/16"
}

module "name_specific_subnet" {
  source               = "cypik/subnet/azure"
  version              = "1.0.1"
  name                 = "app"
  environment          = "test"
  resource_group_name  = module.resource_group.resource_group_name
  location             = module.resource_group.resource_group_location
  virtual_network_name = module.vnet.name

  #subnet
  specific_name_subnet  = true
  specific_subnet_names = "AzureBastionSubnet"
  subnet_prefixes       = ["10.0.1.0/24"]
  # route_table
  enable_route_table = false
}

module "bastion" {
  depends_on          = [module.resource_group]
  source              = "./../"
  name                = "app"
  environment         = "test"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  subnet_id           = module.name_specific_subnet.specific_subnet_id
}
