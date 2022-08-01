FROM debian:buster
LABEL maintainer="mkayumba@student.42.fr"

RUN apt-get -y update && apt-get -y upgrade && apt install -y curl\
 && apt-get update && apt-get install -y wget php7.3-fpm php7.3-mysql php7.3-json php7.3-xmlrpc php7.3-curl php7.3-gd php7.3-xml php7.3-mbstring expect 

COPY ./php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf
COPY ./www.conf    /etc/php/7.3/fpm/pool.d/www.conf
COPY ./docker_entrypoint.sh  /usr/local/bin

WORKDIR /var/www/wordpress
COPY ./wp-config.php  ./
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar  \
&& php wp-cli.phar --info \
&& chmod +x wp-cli.phar \
&& mv wp-cli.phar /usr/local/bin/wp \
&& wp --info

ENTRYPOINT [ "docker_entrypoint.sh" ]
