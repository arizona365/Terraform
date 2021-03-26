terraform {
    backend "s3" {
        bucket = "keskinterraform"
        key    = "terraformstate/data.tfstate"
        region = "us-east-1"
    }
}