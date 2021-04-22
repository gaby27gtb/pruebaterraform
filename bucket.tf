resource "aws_s3_bucket" "bucket_terraform_grupo2" {
  bucket = "bucket_terraform_grupo2"
  acl    = "private"

  tags = {
    Name        = "bucket_terraform_grupo2"
  }
}