module "rds" {
  source = "./modules/rds"

  db_name     = "mydb"
  db_username = "admin"
  db_password = "Admin12345"

  subnet_ids = [
    "subnet-093434380a6d5b8a3",
    "subnet-0350fa6702eb29379"
  ]

  vpc_security_group_ids = [
    "sg-05085e9456f75230f"
  ]
}
