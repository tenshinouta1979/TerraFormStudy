provider "aws" {
  region = "us-west-2"
}

data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "function.zip"
  output_path = "function.zip"
}

resource "aws_s3_bucket" "reference_name" {
  bucket = "tf-bucket-name"

  tags = {
    Name        = "My TerraForm Resources"
    Environment = "Dev"
  }
}

resource "aws_lambda_function" "example" {
  function_name = "tf_example_lambda"

  filename         = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256

  handler = "index.handler"
  runtime = "nodejs18.x"

  role = aws_iam_role.example.arn
}


//terraform init
//terraform apply
//terraform destory
