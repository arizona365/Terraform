terraform {
  backend "s3" {
    bucket = "terraform-state-files-mcalik"
    key    = "tfstate/session6-1.tfstate"
    region = "us-east-1"
  }
}