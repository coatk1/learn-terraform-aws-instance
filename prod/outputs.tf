# Displays output.
output "ami" {
  description = "This variable sets the AMI image to the region."
  value       = aws_instance.terraform_ec2.ami
}

output "ip" {
  description = "This variable sets the AMI image to the region."
  value       = aws_eip.ip.public_ip
}
