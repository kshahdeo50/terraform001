output "admin_name" {
  value = "${aws_iam_group.Administrator.name}"
}

output "biling_name" {
  value = "${aws_iam_group.Billing.name}"
}

output "read_name" {
  value = "${aws_iam_group.ReadOnly.name}"
}