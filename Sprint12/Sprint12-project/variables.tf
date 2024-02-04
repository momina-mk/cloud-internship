variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDR Values"
  default     = ["10.0.0.0/27", "10.0.0.32/27"]
}

variable "private_application_subnet_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDR Values"
  default     = ["10.0.0.64/27", "10.0.0.96/27"]
}

variable "private_data_subnet_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDR Values"
  default     = ["10.0.0.128/27", "10.0.0.160/27"]
}

variable "azs" {
  type        = list(string)
  description = "Availability Zones"
  default     = ["us-east-1a", "us-east-1b"]
}
variable "db_pass" {
    type = string
    default = "my_database_password"
}