resource "aws_s3_bucket" "state_bucket" {
   bucket = "codepanda-terraform-statebucket-2025"
   force_destroy = true
   tags = {
     Name        = "codepanda-terraform-statebucket-2025"
     Environment = "Production"
   }
 }