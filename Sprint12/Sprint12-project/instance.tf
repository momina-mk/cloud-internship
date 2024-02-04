data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}
resource "aws_launch_configuration" "wordpress_ec2" {
  depends_on    = [aws_db_instance.default]
  name_prefix   = "wordpress_ec2config"
  image_id      = data.aws_ami.amazon-linux-2.id
  instance_type = "t2.micro"
  security_groups = [
    aws_security_group.EC2_SG.id
  ]

  user_data = <<-EOF
  #!/bin/bash

yum update -y
yum install -y httpd php php-mysqlnd mysql
service httpd start
cd /var/www/html
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
cp -R wordpress/* .
chown -R apache:apache .
# Create wp-config.php
cat > wp-config.php <<EOL
<?php
define('DB_NAME', 'my_database_name');
define('DB_USER', 'my_database_user');
define('DB_PASSWORD', 'my_database_password');
define('DB_HOST', 'my_database_host');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

\$table_prefix = 'wp_';
define( 'WP_DEBUG', false );

if ( ! defined( 'ABSPATH' ) ) {
    define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';
EOL

# Restart Apache
service httpd restart
EOF
}
