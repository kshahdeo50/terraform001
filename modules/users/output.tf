output "us_name" {
  value = "${aws_iam_user.user1.*.name}"
}