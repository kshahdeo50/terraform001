resource "aws_iam_user" "user1" {
    name = var.users
}
resource "aws_iam_group" "Billing" {
  name = "biling"
}
resource "aws_iam_policy_attachment" "billing_attach" {
  name       = "billing_attach"
  #users      = ["${var.user}"]
  groups     = ["${aws_iam_group.Billing.name}"]
  policy_arn = "arn:aws:iam::aws:policy/job-function/Billing"
}

resource "aws_iam_user_login_profile" "Billing_User" {
  user    = aws_iam_user.user1.name
  pgp_key = "keybase:Kuldeep"
}