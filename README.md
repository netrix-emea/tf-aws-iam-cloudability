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
| external_id | The external identifier to use, given to you by Cloudability | string | - | yes |
| role_name | The name of the role Cloudability will use | string | `CloudabilityRole` | no |
| trusted_account_id | The Cloudability account this role will trust | string | `165736516723` | no |

## License

Apache 2 License. See [LICENSE](LICENSE) for full details.
