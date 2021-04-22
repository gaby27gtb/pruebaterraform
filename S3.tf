terraform {
  backend "s3"{
      bucket = "bucket_terraform_grupo2"
      region = var.region
  }
}