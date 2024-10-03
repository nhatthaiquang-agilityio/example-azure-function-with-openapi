variable "environment" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "az_storage_acc_access_key" {
  type = string
}

variable "azurerm_storage_account_name" {
  type = string
  default = ""
}

variable "azurerm_function_app_name" {
  type = string
  default = ""
}