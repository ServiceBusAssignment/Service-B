terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

module "service-bus-module" {
  source             = "git::https://github.com/mleisa/assignment.git"
  namespace_name     = "namespace-aa"
  queue_name_and_dlq = {
    queue2 = {
      queue_name             = "queue2"
      dead_lettering_enabled = false
    }
  }
  action_group_name       = "team1"
  action_group_short_name = "p1-action"
  alert_rule              = {
    rule-a = {
      alert_name         = "Service-B-Queue2"
      metric_name        = "Messages"
      threshold          = 50
      dimension_operator = "Include"
      queue_name_list    = ["queue2"]
    }
  }
}
