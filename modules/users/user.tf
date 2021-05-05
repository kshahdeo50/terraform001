resource "aws_iam_user" "user1" {
    name = var.users
}

resource "aws_iam_user_login_profile" "pass" {
  user    = aws_iam_user.user1.name
  pgp_key = "keybase: D73C C778 0B15 C1E3 FABD  2F70 2DED 9DE0 A02B D209"
}



























































