data "aws_iam_policy_document" "cloudability_automation_policy" {
  statement {
    actions = ["iam:SimulatePrincipalPolicy",
      "ec2:DescribeTags",
      "ec2:CreateTags",
      "ec2:CreateSnapshot",
      "ec2:DeleteVolume",
      "ec2:DescribeVolumes",
      "ec2:DescribeTags",
      "ec2:DescribeSnapshots",
      "ec2:DeleteSnapshot",
      "ec2:StartInstances",
      "ec2:StopInstances",
      "autoscaling:CreateOrUpdateTags",
      "autoscaling:UpdateAutoScalingGroup",
      "autoscaling:DescribeAutoScalingGroups",
      "autoscaling:DescribeScalingActivities",
      "rds:DescribeDBInstances",
      "rds:DescribeDBClusters",
      "rds:ListTagsForResource",
      "rds:AddTagsToResource",
      "rds:StartDBInstance",
      "rds:StopDBInstance",
    ]

    resources = ["*"]
  }
}

data "aws_iam_policy_document" "cloudability_monitor_resources_policy" {
  statement {
    actions = ["iam:SimulatePrincipalPolicy",
      "cloudwatch:GetMetricStatistics",
      "dynamodb:DescribeTable",
      "dynamodb:ListTables",
      "ec2:DescribeImages",
      "ec2:DescribeInstances",
      "ec2:DescribeRegions",
      "ec2:DescribeReservedInstances",
      "ec2:DescribeReservedInstancesModifications",
      "ec2:DescribeSnapshots",
      "ec2:DescribeVolumes",
      "ecs:DescribeClusters",
      "ecs:DescribeContainerInstances",
      "ecs:ListClusters",
      "ecs:ListContainerInstances",
      "elasticache:DescribeCacheClusters",
      "elasticache:DescribeReservedCacheNodes",
      "elasticache:ListTagsForResource",
      "elasticmapreduce:DescribeCluster",
      "elasticmapreduce:ListClusters",
      "elasticmapreduce:ListInstances",
      "rds:DescribeDBClusters",
      "rds:DescribeDBInstances",
      "rds:DescribeReservedDBInstances",
      "rds:ListTagsForResource",
      "redshift:DescribeClusters",
      "redshift:DescribeReservedNodes",
      "redshift:DescribeTags",
    ]

    resources = ["*"]
  }
}

data "aws_iam_policy_document" "cloudability_assume_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.trusted_account_id}:user/cloudability"]
    }

    condition {
      test     = "StringEquals"
      variable = "sts:ExternalId"

      values = [
        "${var.external_id}",
      ]
    }
  }
}

resource "aws_iam_policy" "cloudability_monitor_resources_policy" {
  count  = "${length(var.external_id)>0?1:0}"
  name   = "${var.monitor_policy_name}"
  path   = "${var.policy_path}"
  policy = "${data.aws_iam_policy_document.cloudability_monitor_resources_policy.json}"
}

resource "aws_iam_policy" "cloudability_automation_policy" {
  count  = "${length(var.external_id)>0?1:0}"
  name   = "${var.automation_policy_name}"
  path   = "${var.policy_path}"
  policy = "${data.aws_iam_policy_document.cloudability_automation_policy.json}"
}
