terraform {
  backend "s3" {
    bucket = "terraform-ravi"
    key    = "terraform/dev/ecs-bulbapp"
    region = "us-east-1"
    profile = "ravishah"
  }
}
