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

data "http" "swagger" {
  url = var.content_value
  request_headers = {
    Accept = "application/json"
  }
}

#  Service API
resource "azurerm_api_management_api" "turbine_service" {
  name                = var.resource_name
  resource_group_name = var.resource_group_name
  api_management_name = var.api_management_name
  revision            = "1"
  display_name        = var.display_name
  description         = var.descriptions
  path                = var.path
  protocols           = ["https","https"]

  subscription_key_parameter_names  {
    header = var.header
    query = var.query
  }

  import {
    content_format = "openapi+json"
    content_value  = data.http.swagger.body
  }
}

resource "azurerm_api_management_api_operation_policy" "apiTurbinePolicy" {
  api_name            = azurerm_api_management_api.turbine_service.name
  api_management_name = var.api_management_name
  resource_group_name = var.resource_group_name
  operation_id        = "Turbine"
  xml_content = <<XML

  <policies>
      <inbound>
          <base />
          <set-backend-service base-url="https://${var.Afname}.azurewebsites.net" />
          <rewrite-uri template="/api/TurbineRepair" />
      </inbound>
      <backend>
          <base />
      </backend>
      <outbound>
          <base />
      </outbound>
      <on-error>
          <base />
      </on-error>
  </policies>

  XML
}
