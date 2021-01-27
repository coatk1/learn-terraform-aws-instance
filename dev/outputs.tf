# Displays output.
# output "ami" {
#   description = "This variable sets the AMI image to the region."
#   value = module.ec2_instances.ami
# }

# output "ip" {
#   description = "This variable sets the AMI image to the region."
#   value = aws_eip.ip.public_ip
# }

# output "vpc_public_subnets" {
#   description = "IDs of the VPC's public subnets"
#   value       = module.vpc.public_subnets
# }

output "ec2_instance_public_ips" {
  description = "Public IP addresses of EC2 instances"
  value       = module.ec2_instances.public_ip
}

