module "create_group" {
  source = "./modules/groups"
}

module "user_create" {
  source = "./modules/users"
  users =  var.u_name
}

module "attach_user"{
    source  = "./modules/attach"
    u_name  = var.u_name
    g_name  = var.g_name
}
