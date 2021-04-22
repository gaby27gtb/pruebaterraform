resource "aws_elb" "balanceador-publico" {
  name               = "balanceador-publico"
  availability_zones = [var.region, var.region2]

  access_logs {
    bucket        = "bucket_terraform_grupo2"
    bucket_prefix = "grupo2"
    interval      = 60
  }

  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }

  instances                   = [aws_instance.instancia-ec2-us-east-1.id, aws_instance.instancia-ec2-us-west-2b.id]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "banceador_grupo2"
  }
}