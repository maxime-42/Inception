FROM debian:buster
LABEL maintainer="mkayumba@student.42.fr"
RUN apt-get update \
        && apt-get -y install apt-utils mariadb-server mariadb-client \
        # && groupadd -r mysql && useradd -r -g mysql mysql \
        && rm -rf /var/lib/mysql \
        && mkdir -p /var/lib/mysql /run/mysqld \
        && chown -R mysql:mysql /var/lib/mysql  /run/mysqld \
        && chmod 777 /var/run/mysqld

VOLUME /var/lib/mysql

COPY ./create_database.sql ./
COPY ./start.sh ./

COPY ./mysql.cnf  /etc/mysql/my.cnf

ENTRYPOINT ["./start.sh"]

EXPOSE 3306
CMD ["mysqld"]
# ENTRYPOINT tail -f /dev/null
