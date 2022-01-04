FROM debian:buster
LABEL maintainer="mkayumba@student.42.fr"
RUN apt-get -y update && apt-get -y upgrade 
WORKDIR /var/www/
COPY ./latest.tar.gz ./
RUN tar -xzf latest.tar.gz && ls -l /var/www/wordpress
