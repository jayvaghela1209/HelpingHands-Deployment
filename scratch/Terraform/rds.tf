module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 6.0"

  identifier = "helpinghands-db"

  # PostgreSQL
  engine         = "postgres"
  engine_version = "18.6"

  # Instance
  instance_class = "db.t3.micro"

  # Storage
  allocated_storage = 20

  # Database
  db_name  = "helpinghands"
  username = "helpinghands_user"
  password = var.db_password
  port     = 5432

  # VPC
  vpc_security_group_ids = [aws_security_group.rds.id]


  create_db_subnet_group = true
  subnet_ids             = module.vpc.private_subnets

  availability_zone = "ap-south-1b"

  # Backup
  backup_retention_period = 7

  storage_encrypted = true

}