#!/bin/sh

service mariadb start

echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PASSWORD';" | mysql

echo "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PASSWORD';" | mysql
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mysql
echo "FLUSH PRIVILEGES;" | mysql

echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" | mysql

service mariadb stop

mysqld


