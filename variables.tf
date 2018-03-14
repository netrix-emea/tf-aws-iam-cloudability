variable "external_id" {
  description = "The external identifier to use, given to you by Cloudability"
}

variable "trusted_account_id" {
  description = "The Cloudability account this role will trust"
  default     = "165736516723"
}

variable "role_name" {
  description = "The name of the role Cloudability will use"
  default     = "CloudabilityRole"
}
