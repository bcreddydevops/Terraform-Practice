module "bcreddy-website" {
  source    = "./modules/ec2"
  ami       = "ami-09d3b3274b6c5d4aa"
  subnet_id = module.mainvpc.pub_sub_ids[0]
  vpc_id    = module.mainvpc.vpc_id
  key_name  = "bcreddydevops1useast1"
  sg_ingress = [
    {
      port     = "80"
      protocal = "tcp"
      cidrs    = ["0.0.0.0/0"]
    },
    {
      port     = "22"
      protocal = "tcp"
      cidrs    = ["175.101.0.0/16"]
    },
    {
      port     = "443"
      protocal = "tcp"
      cidrs    = ["0.0.0.0/0"]
    }

  ]
}

module "mainvpc" {
  source = "./modules/networking"

}

output "name" {
  value = module.mainvpc.pub_sub_ids[*]

} 