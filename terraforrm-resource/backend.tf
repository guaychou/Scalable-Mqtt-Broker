terraform {
    backend "s3" {
        bucket="terraform-kevin"
        key="terraform.tfstate"
        region="us-east-2"
    }
}