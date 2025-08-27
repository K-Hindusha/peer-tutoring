variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
  default     = "peer-tutoring-rg"
}

variable "location" {
  description = "Azure location (must be supported by Static Web Apps)"
  type        = string
  default     = "East US 2"
}

variable "static_app_name" {
  description = "Unique name for the Static Web App (lowercase, letters/numbers/dash)"
  type        = string
  default     = "peertutoringapp"
}
