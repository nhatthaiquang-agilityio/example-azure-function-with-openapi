terraform {
  required_providers {

    azurerm = {
      version = ">= 3.0, < 4.0"
      source = "hashicorp/azurerm"
    }

  }

  backend "azurerm" {
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

# Azure Service Plan
resource "azurerm_service_plan" "doc_app_svc_plan" {
  name                = "asp-test-az-func"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = var.location
  os_type             = "Windows"
  # Windows Consumption
  sku_name            = "Y1"
}

# Azure Function
resource "azurerm_windows_function_app" "doc_app_az_func" {
  name                = var.azurerm_function_app_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = var.location

  storage_account_name = var.azurerm_storage_account_name
  storage_account_access_key = var.az_storage_acc_access_key
  service_plan_id      = azurerm_service_plan.doc_app_svc_plan.id

  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME" = "dotnet-isolated"
  }

  site_config {
  }
}