terraform {
  backend "s3" {
    bucket = "keskinterraform"
    key    = "tfstate/sample-module.tfstate"
    region = "us-east-1"
  }
}