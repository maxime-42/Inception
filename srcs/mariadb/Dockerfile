# FROM debian:buster
# LABEL maintainer="mkayumba@student.42.fr"
# RUN apt-get update && apt-get -y upgrade && apt-get -y install apt-utils
# RUN apt-get -y install mariadb-server 
# # RUN apt-get -y install mariadb-server mariadb-client

# # RUN  chown -R mysql:mysql /var/run/mysqld
# # RUN			mkdir -p /run/mysqld && mkdir -p /var/lib/mysql
# # RUN			chown -R mysql:mysql /run/mysqld && chown mysql:mysql /var/lib/mysql


# # RUN service mysql start
# COPY ./create_database.sql ./
# COPY ./start.sh ./

# COPY ./mysql.cnf  /etc/mysql/conf.d/

# ENTRYPOINT ["./start.sh"]
# # CMD [mysqld_safe]




FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server expect
COPY ./srcs/* /root/
RUN mv /root/mysql.cnf /etc/mysql/conf.d
RUN chmod 777 ~/*.sh ~/*exp #To avoid permission issues =-)
ENTRYPOINT ~/init.sh