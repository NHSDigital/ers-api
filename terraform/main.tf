provider "apigee" {
  org          = var.apigee_organization
  access_token = var.apigee_token
}

terraform {
  backend "azurerm" {}

  required_providers {
    apigee = "~> 0.0"
    archive = "~> 1.3"
  }
}

module "ers_api" {
  source             = "github.com/NHSDigital/api-platform-service-module"
  name               = "ers-api"
  path               = "ers-api"
  apigee_environment = var.apigee_environment
  proxy_type         = "sandbox"
  namespace          = var.namespace
  make_api_product   = false
  # api_product_display_name = "ERS API"
  # api_product_description  = ""
}