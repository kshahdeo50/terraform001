resource "aws_iam_group_membership" "assign" {
    name = "assignment"
    users = [
        "${var.u_name}",
    ]
  group= "${var.g_name}"
}




















