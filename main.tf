terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.48.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  environment     = "public"
}


provider "azurerm" {
  alias           = "target"
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  environment     = "public"
}


locals {
  region_short = var.region_short_map[var.location]
}

# -------------------------
# 1. Resource Group
# -------------------------
module "resource_group" {
  source           = "../../../modules/resource_group"
  location         = var.location
  env              = var.env
  product          = var.product

  naming_prefix    = var.naming.prefix
  delimiter        = var.naming.delimiter
  region_short_map = var.region_short_map
  subscription_id  = var.subscription_id
  tags             = var.common_tags

  providers = {
    azurerm.target = azurerm.target
  }
}

# -------------------------
# 2. Storage Account + Containers
# -------------------------
module "tfstate_storage" {
  source = "../../../modules/tfstate_storage"

  naming_prefix       = var.naming.prefix
  delimiter           = var.naming.delimiter
  product             = var.product
  env                 = var.env
  location            = var.location
  region_short_map    = var.region_short_map
  subscription_id     = var.subscription_id
  tenant_id           = var.tenant_id
  resource_group_name = module.resource_group.name
  #resource_group_name = module.tfstate_rg
  #resource_group_name = module.resource_group.name
  tags                = var.common_tags

  providers = {
    azurerm.target = azurerm.target
  }
}
