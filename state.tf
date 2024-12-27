terraform {
  backend "s3" {
    bucket         = "my_backet"
    key            = "kiu_challenge"
    region         = local.region
    dynamodb_table = "kiu_challenge"
  }
}
