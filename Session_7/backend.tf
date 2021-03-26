terraform {
  backend "s3" {
    bucket = "keskinterraform"
    key    = "tfstate/vpc-module.tfstate"
    region = "us-east-1"
  }
}