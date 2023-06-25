variable "environment" {
  type        = string
  description = "Environment name E.g. Dev,Test,UAT,Prod"
  default     = "Test"
}


variable "region" {
  type        = string
  description = "Region the resource would get created in E.g. EastUS,CentralUS"
  default     = "East US"
}


variable "admin_username" {
  type        = string
  description = "The administrator username of the SQL logical server."
  default     = "azureadmin"
}

variable "admin_password" {
  type        = string
  description = "The administrator password of the SQL logical server."
  sensitive   = true
}
