resource "aws_iam_group" "Administrator" {
  name = "admin"
}
resource "aws_iam_group" "Billing" {
  name = "billing"
}
resource "aws_iam_group" "ReadOnly" {
  name = "readonly"
}

resource "aws_iam_policy_attachment" "admin_attach" {
  name       = "admin_attach"
  #users      = ["${var.user}"]
  groups     = ["${aws_iam_group.Administrator.name}"]
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}


resource "aws_iam_policy_attachment" "billing_attach" {
  name       = "billing_attach"
  #users      = ["${var.user}"]
  groups     = ["${aws_iam_group.Billing.name}"]
  policy_arn = "arn:aws:iam::aws:policy/job-function/Billing"
}

resource "aws_iam_policy_attachment" "readonly_attach" {
  name       = "readonly_attach"
  #users      = ["${var.user}"]
  groups     = ["${aws_iam_group.ReadOnly.name}"]
  policy_arn = "arn:aws:iam::aws:policy/job-function/Billing"
}
