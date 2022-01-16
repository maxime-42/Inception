#!/bin/sh

echo "initialization of database"

mysqld_safe &
sleep 2

echo "create user"
sleep 2
mysql -e "CREATE DATABASE IF NOT EXISTS ${MARIADB_DATABASE};"
mysql -e "CREATE USER IF NOT EXISTS ${WP_DB_USER}@'%' IDENTIFIED BY '${WP_DB_USER}';"
mysql -e "CREATE USER IF NOT EXISTS ${WP_ADMIN_USER}@'%' IDENTIFIED BY '${WP_ADMIN_USER}';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO ${WP_ADMIN_USER}@'%' IDENTIFIED BY '${WP_ADMIN_USER}';"
mysql -e "GRANT ALL PRIVILEGES ON ${MARIADB_DATABASE}.* TO ${WP_DB_USER}@'%';"
mysql -e "FLUSH PRIVILEGES;"
#        GRANT ALL ON wordpress.* TO 'admin'@'localhost' IDENTIFIED BY 'admin' WITH GRANT OPTION;

echo "database shutdown"
# sleep 2
mysqladmin shutdown

echo "database restarting"
sleep 2

exec mysqld -u root