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
