#!/bin/bash

########### mysql ##################
# touch /var/run/mysqld/mysqld.sock
chmod -R 755 /var/lib/mysql/

# chmod 777 /var/run/mysqld/mysqld.sock
# cat ./mysql.cnf > /etc/mysql/mariadb.cnf
service mysql start
mysql -u root < create_database.sql




/bin/sh