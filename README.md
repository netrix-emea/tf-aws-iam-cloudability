# tf-aws-iam-cloudability

Cloudability is a cloud cost management platform that improves visibility, optimization, governance and more across cloud environments.

This repository is related to make cloudability integration in your Aws environment.

# Configure account for cloudability monitoring

## Prerequisites

* Get External ID from cloudability in the form of a uuid. This UUID can be found in the cloudformation stack at the cloudability console.

## Configure

Add a cloudability.tf to the account directory

```
variable "cloudability_external_id" {
  description = "Cloudability External id, provided by cloudability"
  default     = ""
}

module "cloudability" {
  source      = "../modules/tf-aws-cloudability"
  external_id = "${var.cloudability_external_id}"
}
```

Add the External ID to  the tfvars file (config.auto.tfvars)
```
cloudability_external_id = "6124f6fd-6964-4fa6-9047-xxxxxxxxxxx"
```

_Without the external_id the role is not created_

## Role already exists

When it already exists terraform gives this error:

```
* aws_iam_role.cloudability_role: Error creating IAM Role CloudabilityRole: EntityAlreadyExists: Role with name CloudabilityRole already exists.
	status code: 409, request id: xxxxxx-xxxx-xxxx-xxxx-xxxxxxxxx
```

### Import The role:

To import the resource Terraform has the following command available:
```
terraform  import  module.cloudability.aws_iam_role.cloudability_role  CloudabilityRole
```


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| automation_policy_name | Name of automation resource policy | string | `CloudabilityAutomationPolicy` | no |
| enabled | Enable Policies and role | string | `true` | no |
| external_id | The external identifier to use, given to you by Cloudability | string | `xxxxxx-xxxx-xxxx-xxxx-xxxxxxxxx` | no |
| monitor_policy_name | Name of monitor resource policy | string | `CloudabilityMonitorResourcesPolicy` | no |
| policy_path | Path in IAM for policies | string | `/` | no |
| role_name | Name of Cloudability Role | string | `CloudabilityRole` | no |
| role_path | Path in IAM for role | string | `/` | no |
| trusted_account_id | Trusted Account from Cloudability | string | `xxxxxxxx` | no |

## Outputs

| Name | Description |
|------|-------------|
| role_arn | IAM Role arn of cloudability |
| role_id | IAM Role id of cloudability |
