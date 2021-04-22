
resource "aws_instance" "instancia-ec2-us-east-1" {
    ami                 = var.ami
    instance_type       = var.instance_type
    key_name            = var.key_name
    vpc_security_group_ids = [aws_security_group.allow-ssh.id, aws_security_group.allow-http.id]
    #security_groups = ["allow-ssh"]
    subnet_id = aws_subnet.vpc-subnet-us-east-1a.id
    tags = {
        Name        = "instancia-ec2-us-east-1"
        terraform   = "True"
    }
}

resource "aws_instance" "instancia-ec2-us-west-2b" {
    ami                 = var.ami2
    instance_type       = var.instance_type
    key_name            = var.key_name
    vpc_security_group_ids = [aws_security_group.allow-ssh.id, aws_security_group.allow-http.id]
    #security_groups = ["allow-ssh"]
    subnet_id = aws_subnet.vpc-subnet-us-west-2b.id
    tags = {
        Name        = "instancia-ec2-us-west-2b"
        terraform   = "True"
    }
}
