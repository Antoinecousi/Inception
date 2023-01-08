#!/bin/sh
service mysql start;
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"	# create database
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';" # create user
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';" # grant all privileges to user
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';" # change root password
mysql -e "FLUSH PRIVILEGES;" # reload privileges to make changes effective
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown # connected with root user then shutdown
exec mysqld_safe # start mysql server but not as a daemon process (so that it can restart if it crashes)