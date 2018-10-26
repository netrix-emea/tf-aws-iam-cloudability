locals {
  role_id  = "${var.external_id==""?element(concat(aws_iam_role.cloudability_role.*.id,list("")),0):""}"
  role_arn = "${var.external_id==""?element(concat(aws_iam_role.cloudability_role.*.arn,list("")),0):""}"
}

output "role_id" {
  description = "IAM Role id of cloudability"
  value       = "${local.role_id}"
}

output "role_arn" {
  description = "IAM Role arn of cloudability"
  value       = "${local.role_arn}"
}
