resource "aws_iam_user" "user1" {
    name = var.users
}

resource "aws_iam_user_login_profile" "pass" {
  user    = aws_iam_user.user1.name
  pgp_key = "mI0EYJKR+AEEAOV6Fh6daCCD/ANNllwOWoa8KGvHAfOO8qkH0IVQq+lDr04KKBOIzyuwX2g407JKIrp0Cw6WAUstORZLbW3dpew0lEogwKPMD7KrhhDajtD7OMXwN4vDmq+b7QRmkJwYzYHzbXqZJR73akpLeyB/SOrUCKgNHZ8F3LQorU+neB13ABEBAAG0B0t1bGRlZXCInAQQAQIABgUCYJKR+AAKCRBCqqaJghTh1DKcBAC1DH5aDcTboh1w1ayBvhzvmrhP9yXzKAL226M2bOd9eNqc4GgkH9UW8eE7JdUF6Tp/OpI3Sm9sM+/FOp88Qqxnjv6FYg+uDqWdCd1n2OFZqrUUxSzP/+rp/RPvoUhb9r0rXaB/toQNS9j/8c8oAEUKFVbBfoNl4nD5si1ijV6QkQ===RcAr"
    
    }

























































