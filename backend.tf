terraform {
  backend "s3" {
    bucket = "terraform-ravi"
    key    = "terraform/dev/ecs-nginx"
    region = "us-east-1"
    profile = "ravishah"
  }
}
