output "password" {
  value = aws_iam_user_login_profile.user1.encrypted_password
}