# learn-terraform-aws-instance
terraform (v0.14.4) tutorial with AWS

## Commands

Initializes terraform directory.
```
terraform init
```

Format configuration.
```
terraform fmt
```

Check if configuration syntax is valid.
```
terraform validate
```

Check was changes were made.
```
terraform plan
```

Apply changes to current configuration.
```
terraform apply
```

Destroy resources to current configuration.
```
terraform destroy
```

Add file name that specifies terraform variables. If file named, `terraform.tfvars` or `*.auto.tfvars`, then can use `terraform apply`
```
terraform apply -var-file="terraform.tfvars"
```

Define variable via command-line flags
```
terraform apply -var region=us-west-2
```

Display output
```
terraform output output_name
```

## Resources
* https://learn.hashicorp.com/tutorials/terraform/aws-build?in=terraform/aws-get-started
* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
* https://www.terraform.io/docs/backends/types/s3.html
* https://www.terraform.io/docs/language/values/variables.html
* https://learn.hashicorp.com/collections/terraform/configuration-language
* https://learn.hashicorp.com/tutorials/terraform/cloud-migrate?in=terraform/state
* https://learn.hashicorp.com/collections/terraform/modules

### State Files
* https://mohitgoyal.co/2020/09/30/upload-terraform-state-files-to-remote-backend-amazon-s3-and-azure-storage-account/
* https://medium.com/@jessgreb01/how-to-terraform-locking-state-in-s3-2dc9a5665cb6
* https://www.terraform.io/docs/language/settings/backends/s3.html
* https://medium.com/faun/creating-an-s3-bucket-module-in-terraform-c89b77f2b1ae

### Best Practices
* https://www.terraform-best-practices.com/
* https://stackoverflow.com/questions/33157516/best-practices-when-using-terraform
* https://learn.hashicorp.com/tutorials/terraform/organize-configuration?in=terraform/modules
