variable "resource_group" {
  description = "Resource group for environment"
  type        = string
  default     = ""
}

variable "deploy_location" {
  description = "Location for deploying"
  type        = string
  default     = ""
}

variable "environment" {
  description = "Name of the environemnt"
  type        = string
  default     = ""
}

variable "department" {
  description = "department for deploying"
  type        = string
  default     = ""
}

variable "app_source" {
  description = "source that deploy this resource"
  type        = string
  default     = ""
}

variable "storage_account_tier" {
  description = "Account Tier of the storage account, it could be Standard, Premium"
  type        = string
  default     = ""
}


variable "storage_account_replication_type" {
  description = "Storage account relication type, it could be LRS, ZRS, GRS or RA-GRS"
  type        = string
  default     = ""
}
