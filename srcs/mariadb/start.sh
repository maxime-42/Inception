#!/bin/sh

set -e

export	DATADIR=/var/lib/mysql
export	SOCKET=/run/mysqld/mysqld.sock

BOLD="\e[1m"
RESET="\e[0m"
LIGHT_RED="\e[91m"
LIGHT_GREEN="\e[92m"
LIGHT_CYAN="\e[96m"

logging(){
	local type=$1; shift
	printf "${LIGHT_CYAN}${BOLD}Entrypoint${RESET} [%b] : %b\n" "$type" "$*"
}
log_info(){
	logging "${LIGHT_GREEN}info${RESET}" "$@"
}
log_error(){
	logging "${LIGHT_RED}error${RESET}" "$@" >&2
	exit 1
}

temp_server_start(){
	mysqld --skip-networking &
	log_info 'Waiting server  startup'
	i=30 		# wait 30s maximum
	while [ $i -gt 0 ]; do
		has_started="$(echo "SELECT 1; " | mysql -uroot --database=mysql 2> /dev/null || true)"
		if [ "$has_started" ]; then
			break
		fi
		sleep 1
		i=$((i - 1))
	done
	if [ "$i" = "0" ]; then
		log_error 'Unable to start server.'
	fi
	log_info 'Server started.'
}

temp_server_stop(){
	log_info "Stopping temporary server"
	if ! mysqladmin shutdown -ugroot -p"$MARIADB_PASSWORD" ; then
		log_error "Unable to shutdown server"
	fi
	log_info "Temporary server stopped"
}

setup_db(){
	# Sets groot users password and creates the non-localhost groot user
	local grootCreate=
	read -r -d '' grootCreate <<-EOF || true
		RENAME USER 'root'@'localhost'   TO 'groot'@'localhost';
		RENAME USER 'root'@'127.0.0.1'   TO 'groot'@'127.0.0.1';
		RENAME USER 'root'@'::1'         TO 'groot'@'::1';
		RENAME USER 'root'@'${HOSTNAME}' TO 'groot'@'${HOSTNAME}';
		SET PASSWORD FOR 'groot'@'localhost'  =PASSWORD('${MARIADB_PASSWORD}') ;
		SET PASSWORD FOR 'groot'@'127.0.0.1'  =PASSWORD('${MARIADB_PASSWORD}') ;
		SET PASSWORD FOR 'groot'@'::1'        =PASSWORD('${MARIADB_PASSWORD}') ;
		SET PASSWORD FOR 'groot'@'${HOSTNAME}'=PASSWORD('${MARIADB_PASSWORD}') ;
		CREATE USER 'groot'@'${MARIADB_HOST}' IDENTIFIED BY '${MARIADB_PASSWORD}' ;
		GRANT ALL ON *.* TO 'groot'@'localhost' WITH GRANT OPTION ;
		GRANT ALL ON *.* TO 'groot'@'${MARIADB_HOST}' WITH GRANT OPTION ;
	EOF

	# create the user and give him access to the database schema
	local userCreate=
	read -r -d '' userCreate <<-EOF || true
		CREATE USER '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PASSWORD}' ;
		GRANT ALL ON \`${MARIADB_DATABASE}\`.* TO '${MARIADB_USER}'@'%' ;
	EOF

	mysql -uroot --database=mysql <<-EOF
		${grootCreate}
		DROP DATABASE IF EXISTS test ;
		CREATE DATABASE IF NOT EXISTS \`${MARIADB_DATABASE}\` ;
		${userCreate}
		FLUSH PRIVILEGES ;
	EOF
	log_info "Creating the groot user..."
	log_info "Creating database ${MARIADB_DATABASE}..."
	log_info "Creating user ${MARIADB_USER}..."
	log_info "Giving user ${MARIADB_USER} access to schema ${MARIADB_DATABASE}..."
}

execute_sql_file(){
	mysql -ugroot -p"$MARIADB_PASSWORD" --database="$MARIADB_DATABASE" < "$@"
}

execute_init_files(){
	for file in /docker-entrypoint-initdb.d/* ; do
		case "$file" in
			*.sql)
				log_info "Init files: Executing $file"
				execute_sql_file "$file";;
			*)
				log_error "Init files: What the heck $file file is ? What am I supposed to do ?";;
		esac
	done
}

if [ "$1" = "mysqld" ]; then
	log_info "Entrypoint script for mysql server started..."
	if [ -z "$MARIADB_HOST" -o -z "$MARIADB_PASSWORD" -o -z "$MARIADB_DATABASE" -o -z "$MARIADB_USER" -o -z "$MARIADB_PASSWORD" ]; then
		log_error "Missing one of theses environment variables :\n\tMARIADB_HOST\n\tMARIADB_PASSWORD\n\tMARIADB_DATABASE\n\tMARIADB_USER\n\tMARIADB_PASSWORD"
	fi

	# if [ "$(id -u)" = "0" ]; then
	# 	log_info "Switch from root to user mysql"
	# 	chown -R mysql:mysql /var/lib/mysql
	# 	exec su-exec mysql "$0" "$@"
	# fi

	if [ ! -d $DATADIR/mysql ]; then		# if there is no database, initialize database directory ( == if first time container run...)
		log_info 'Initialize mysql database (at first startup only)'
		mysql_install_db --datadir=$DATADIR --rpm --auth-root-authentication-method=normal --skip-test-db > /dev/null
		log_info 'Mysql init done.'
		temp_server_start
	 	setup_db
		execute_init_files
		temp_server_stop
		log_info 'Mysql init done.'
	else
		log_info 'Skipping initialization. Mysql database already created.'
	fi
	log_info 'Ready for startup\n'
fi
exec "$@"
# mysql -u root < create_database.sql

/bin/sh