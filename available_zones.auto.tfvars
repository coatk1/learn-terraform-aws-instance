# Variable definition file

region = "us-east-1"  # Changed from us-west-2. This is default unless set `terraform apply -var region=us-west-2`
amis = {
    "us-east-1" = "ami-03ff55e13c2ca241e"  # Changed from ami-830c94e3. Using us-east-1 region.
    "us-west-2" = "ami-830c94e3"
}
# vpc    = ["sg-04638424"]
# subnet = "subnet-8da367ac"
