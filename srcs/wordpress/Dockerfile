FROM debian:buster
LABEL maintainer="mkayumba@student.42.fr"
RUN apt-get -y update && apt-get -y upgrade
RUN  apt-get update && apt-get install -y wget php7.3-fpm php7.3-mysql php7.3-json php7.3-xmlrpc php7.3-curl php7.3-gd php7.3-xml php7.3-mbstring expect

# COPY ./latest.tar.gz /var/www/
COPY ./php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf
COPY ./www.conf    /etc/php/7.3/fpm/pool.d/www.conf

# COPY ./start.sh	./
# EXPOSE 9000
# ENTRYPOINT tar -xzf /var/www/latest.tar.gz  
ENTRYPOINT php-fpm7.3 -F
