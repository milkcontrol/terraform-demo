resource "aws_s3_bucket" "my_bucket" {
  bucket = "${var.bucket_name}-${var.enviroment}-store"  # Đảm bảo tên bucket là duy nhất
  acl    = "private"  # Quyền truy cập của bucket
}