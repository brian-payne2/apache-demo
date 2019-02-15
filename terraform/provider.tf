terraform {
    backend "s3" {
        bucket="brian-payne-terraform-state"
        key="terraform/demo/terraform_dev.tfstate"
        region="us-east-1"
        dynamodb_table = "tf-locks"
    }
}
