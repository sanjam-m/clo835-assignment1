terraform {
  backend "s3" {
    bucket = "dev-clo835-assignment1"
    key    = "dev-infrastructure/terraform.tfstate"
    region = "us-east-1"
  }
}