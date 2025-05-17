module "network" {
  source             = "./Modules/Network"
  vpc-cidr           = var.vpc-cidr
  public-subnets     = var.public-subnets
  private-subnets    = var.private-subnets
  nat-gw-subnet-name = var.nat-gw-subnet-name
}

module "compute" {
  source                               = "./Modules/Compute"
  instances-ami-id                     = var.instances-ami-id
  application-vpc-id                   = module.network.application-vpc-id
  public-subnets-ids                   = module.network.public-subnets-ids
  private-subnets-ids                  = module.network.private-subnets-ids
  load-balancer-security-group-id      = module.network.load-balancer-security-group-id
  bastion-server-security-group-id     = module.network.bastion-server-security-group-id
  application-server-security-group-id = module.network.application-server-security-group-id

  depends_on = [module.network]
}

resource "null_resource" "copy-key-pairs" {
  provisioner "local-exec" {
    command = "cp ssh-private-key ~/.ssh/ && cp ssh-private-key.pub ~/.ssh/"
  }
}

resource "local_file" "ansible-inventory" {
  filename = "../Ansible/inventory.ini"
  content  = <<END
[bastion_server]
bastion_server ansible_host=${module.compute.bastion-server-public-ip}

[application_server]
application_server ansible_host=${module.compute.application-server-private-ip} ansible_ssh_common_args="-o ProxyJump=ubuntu@${module.compute.bastion-server-public-ip}"
END
}
