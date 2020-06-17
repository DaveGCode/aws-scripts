#!/bin/bash
yum update -y
yum install -y httpd
echo '<h1>Hello World</h1>' > /var/www/html/index.html
service start httpd
chkconfig httpd on
