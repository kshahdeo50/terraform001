resource "aws_iam_user" "user1" {
    name = var.users
}

resource "aws_iam_user_login_profile" "pass" {
  user    = aws_iam_user.user1.name
  pgp_key = ""

























































