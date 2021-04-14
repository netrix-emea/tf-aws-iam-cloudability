# Setting up cloudability

resource "aws_iam_role" "cloudability_role" {
  count              = length(var.external_id) > 0 ? 1 : 0
  name               = var.role_name
  path               = var.role_path
  assume_role_policy = data.aws_iam_policy_document.cloudability_assume_policy.json
}

resource "aws_iam_role_policy_attachment" "cloudability_automation_policy" {
  count      = length(var.external_id) > 0 ? 1 : 0
  role       = aws_iam_role.cloudability_role[0].id
  policy_arn = aws_iam_policy.cloudability_automation_policy[0].arn
}

resource "aws_iam_role_policy_attachment" "cloudability_monitor_resources_policy" {
  count      = length(var.external_id) > 0 ? 1 : 0
  role       = aws_iam_role.cloudability_role[0].id
  policy_arn = aws_iam_policy.cloudability_monitor_resources_policy[0].arn

}

