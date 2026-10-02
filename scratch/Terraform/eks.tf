module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name               = "helpinghands-cluster"
  kubernetes_version = "1.33"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  endpoint_public_access = true

  enable_cluster_creator_admin_permissions = true

  eks_managed_node_groups = {
    general = {
      name = "helpinghands-nodes"

      instance_types = ["t3.small"]

      min_size     = 2
      max_size     = 4
      desired_size = 2

      subnet_ids = module.vpc.private_subnets
    }
  }

  tags = {
    Project     = "HelpingHands"
    Environment = "dev"
  }
}