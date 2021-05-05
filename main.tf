module "create_group" {
  source = "./modules/groups"
}

  
  module "attach_user"{
    source  = "./modules/attach"
    u_name  = var.u_name
    g_name  = var.g_name
}
    
    
module "attach_user"{
    source  = "./modules/attach"
    u_name  = var.u_name
    g_name  = var.g_name
}
