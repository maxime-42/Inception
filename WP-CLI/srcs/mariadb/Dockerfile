FROM debian:buster
LABEL maintainer="mkayumba@student.42.fr"
RUN apt-get update \
        && apt-get -y install apt-utils mariadb-server mariadb-client \
        && rm -rf /var/lib/mysql \
        && mkdir -p /var/lib/mysql /run/mysqld \
        && chown -R mysql:mysql /var/lib/mysql  /run/mysqld \
        && chmod 777 /var/run/mysqld\
		&&  apt-get -y install emacs

VOLUME /var/lib/mysql

COPY ./start.sh ./
COPY ./dump.sql ./
EXPOSE 3306

ENTRYPOINT ["./start.sh"]

# CMD ["mysqld"]
