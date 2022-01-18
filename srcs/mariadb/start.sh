#!/bin/sh


# mysqld --skip-networking &
if [ ! -d $DATADIR/mysql ]; then #check if database is not already created
	echo "\n[i]Initialization of database\n"
	mysql_install_db --datadir=$DATADIR    > /dev/null

	echo "\n[i] start === mysqld_safe === is startup script is in MariaDB distributions on Linux and Unix. 
	It is a wrapper that starts mysqld with some extra safety features. 
	For example, if mysqld_safe notices that mysqld has crashed, then mysqld_safe will automatically restart mysqld.\n"
	mysqld_safe &

	echo "[i] Create user\n"
	sleep 1
	mysql -e "CREATE DATABASE IF NOT EXISTS ${MARIADB_DATABASE};"
	mysql -e "CREATE USER IF NOT EXISTS ${WP_DB_USER}@'%' IDENTIFIED BY '${WP_DB_USER}';"
	mysql -e "CREATE USER IF NOT EXISTS ${WP_ADMIN_USER}@'%' IDENTIFIED BY '${WP_ADMIN_USER}';"
	mysql -e "GRANT ALL PRIVILEGES ON *.* TO ${WP_ADMIN_USER}@'%' IDENTIFIED BY '${WP_ADMIN_USER}';"
	mysql -e "GRANT ALL PRIVILEGES ON ${MARIADB_DATABASE}.* TO ${WP_DB_USER}@'%';"
	mysql -e "FLUSH PRIVILEGES;"

	echo "\n[i] Insert Wordpress database backup\n"
	mysql -u root wordpress < ./wp_backup_db.sql
	echo "[i] database shutdown\n"
	sleep 2
	mysqladmin shutdown

	echo "[i] database restarting\n"
	sleep 2
else
	echo "[i] Skipping initialization. Mysql database already created\n"
fi
echo "[i] Starting mariadb server"
exec mysqld -u root

