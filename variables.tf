variable "enabled" {
  description = "Enable Policies and role"
  default     = "true"
  type        = string
}

variable "trusted_account_id" {
  description = "Trusted Account from Cloudability"
  default     = "165736516723"
  type        = string
}

variable "monitor_policy_name" {
  description = "Name of monitor resource policy"
  default     = "CloudabilityMonitorResourcesPolicy"
  type        = string
}

variable "automation_policy_name" {
  description = "Name of automation resource policy"
  default     = "CloudabilityAutomationPolicy"
  type        = string
}

variable "policy_path" {
  description = "Path in IAM for policies"
  default     = "/"
  type        = string
}

variable "role_path" {
  description = "Path in IAM for role"
  default     = "/"
  type        = string
}

variable "role_name" {
  description = "Name of Cloudability Role"
  default     = "CloudabilityRole"
  type        = string
}

variable "external_id" {
  description = "The external identifier to use, given to you by Cloudability"
  default     = ""
  type        = string
}
