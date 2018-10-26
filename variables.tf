variable "trusted_account_id" {
  description = "Trusted Account from Cloudability"
  default     = "165736516723"
}

variable "monitor_policy_name" {
  description = "Name of monitor resource policy"
  default     = "CloudabilityMonitorResourcesPolicy"
}

variable "automation_policy_name" {
  description = "Name of automation resource policy"
  default     = "CloudabilityAutomationPolicy"
}

variable "policy_path" {
  description = "Path in IAM for policies"
  default     = "/"
}

variable "role_path" {
  description = "Path in IAM for role"
  default     = "/"
}

variable "role_name" {
  description = "Name of Cloudability Role"
  default     = "CloudabilityRole"
}

variable "external_id" {
  description = "The external identifier to use, given to you by Cloudability"
}
