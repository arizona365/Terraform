terraform {
    backend "s3" {
        bucket = "keskinterraform"
        key    = "terraformstate/webserver.tfstate"
        region = "us-east-1"
    }
}