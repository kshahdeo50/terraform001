output "us_name" {
  value = "${aws_iam_user.user1.*.name}"
}

#output "password" {
#  value = aws_iam_user_login_profile.pass.encrypted_password
#}
