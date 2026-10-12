
terraform {
  backend "azurerm" {
    resource_group_name   = "az-rg-tfstate-prod-uks"
    storage_account_name  = "azstatfstateproduks"
    container_name        = "az-container-tfstate-prod-uks"
    key                   = "az-key-tfstate-prod.tfstate"
    use_azuread_auth      = true
    environment           = "public"
  }
}

