#!/bin/bash

########### mysql ##################
# touch /var/run/mysqld/mysqld.sock
chmod -R 755 /var/lib/mysql/



sudo touch /var/run/mysqld/mysqld.sock
sudo touch /var/run/mysqld/mysqld.pid
sudo chown -R mysql:mysql /var/run/mysqld/mysqld.sock
sudo chown -R mysql:mysql /var/run/mysqld/mysqld.pid
sudo chmod -R 644 /var/run/mysqld/mysqld.sock
# chmod 777 /var/run/mysqld/mysqld.sock
# cat ./mysql.cnf > /etc/mysql/mariadb.cnf
service mysql start
mysql -u root < create_database.sql




/bin/sh