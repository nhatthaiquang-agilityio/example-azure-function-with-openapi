variable "resource_name" {
  description = "Resource name"
  type        = string
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group Name."
}

variable "api_management_name" {
  type        = string
  description = "API Management Name."
}

variable "display_name" {
  type        = string
  description = "Display Name."
}

variable "descriptions" {
  type        = string
  description = "Description api Name."
}

variable "path" {
  type        = string
  description = "path."
}

variable "header" {
  type        = string
  description = "Header."
}

variable "query" {
  type        = string
  description = "Query."
}

variable "content_value" {
  type        = string
  description = "Content Value."
}

variable "Afname"{
 type        = string
  description = "Azure function name."
}

variable "api_management_logger_id" {
  type        = string
  description = "api_management_logger_id"
}
