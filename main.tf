provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "reference_name" {
  bucket = "tf-bucket-name"

  tags = {
    Name        = "My TerraForm Resources"
    Environment = "Dev"
  }
}

//terraform init
//terraform apply
//terraform destory
