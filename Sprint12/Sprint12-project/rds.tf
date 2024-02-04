resource "aws_db_instance" "default" {
  allocated_storage      = 20
  max_allocated_storage  = 100
  db_name                = "my_database_name"
  engine                 = "mysql"
  engine_version         = "8.0.33"
  instance_class         = "db.t2.micro"
  username               = "my_database_user"
  password               = var.db_pass
  storage_type           = "gp2"
  parameter_group_name   = "default.mysql8.0"
  skip_final_snapshot    = true
  identifier             = "wordpress-db"
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.RDS_SG.id]
}