variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

variable "client_id" {
  description = "Service Principal Client ID"
  type        = string
  sensitive   = true
}

variable "client_secret" {
  description = "Service Principal Client Secret"
  type        = string
  sensitive   = true
}

variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
  default     = "peer-tutoring-rg"
}

variable "location" {
  description = "Azure Region"
  type        = string
  default     = "East US"
}

variable "static_web_app_name" {
  description = "Static Web App Name"
  type        = string
  default     = "peer-tutoring-project"
}