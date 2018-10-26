# tf-aws-iam-cloudability

Terraform module that creates the Cloudability Role for a Linked Account

## Requirements

 * Cloudability `external id` assigned to your account

## Usage

```hcl
module "cloudability" {
  source      = "git::https://github.com/edrans/tf-aws-iam-cloudability.git?ref=master"
  external_id = "99999999-8888-7777-6666-555555555555"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| automation_policy_name | Name of automation resource policy | string | `CloudabilityAutomationPolicy` | no |
| external_id | The external identifier to use, given to you by Cloudability | string |  | yes |
| monitor_policy_name | Name of monitor resource policy | string | `CloudabilityMonitorResourcesPolicy` | no |
| policy_path | Path in IAM for policies | string | `/` | no |
| role_name | Name of Cloudability Role | string | `CloudabilityRole` | no |
| role_path | Path in IAM for role | string | `/` | no |
| trusted_account_id | Trusted Account from Cloudability | string | `165736516723` | no |

## Outputs

| Name | Description |
|------|-------------|
| role_arn | IAM Role arn of cloudability |
| role_id | IAM Role id of cloudability |

## License

Apache 2 License. See [LICENSE](LICENSE) for full details.
