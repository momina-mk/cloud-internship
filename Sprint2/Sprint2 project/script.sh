apt-get update && apt-get upgrade
#scp C:\Users\U.E\Sprint2 project
apt snap install docker
docker pull nginx:latest
sudo snap install aws-cli --classic
aws s3 cp C:/Users/U.E/Sprint2-project/index.html s3://momina's bucket
aws s3 mv s3://momina's bucket /var/www/html/index.nginx-debian.html
systemctl enable --now nginx
docker start -dp 80:80 nginx:latest
