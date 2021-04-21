provider "aws" {
  profile = "default"
  region = var.region
}
resource "aws_instance" "despliegue-terraform-ec2" {
    ami                 = var.ami
    instance_type       = var.instance_type
    key_name            = var.key_name
    vpc_security_group_ids = [aws_security_group.allow-ssh.id]
    #security_groups = ["allow-ssh"]
    subnet_id = aws_subnet.vpc-subnet-us-east-1a.id
    tags = {
        Name        = "test-terraform-ec2"
        terraform   = "True"
    }
}