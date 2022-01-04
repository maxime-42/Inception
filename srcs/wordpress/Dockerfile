FROM debian:buster
# LABEL maintainer="mkayumba@student.42.fr"
RUN apt-get -y update && apt-get -y upgrade 
RUN mkdir -p /var/www/wordpress
COPY ./latest.tar.gz ./
RUN tar -xzf latest.tar.gz 
RUN mv wordpress/* var/www/wordpress

# RUN wget https://wordpress.org/latest.tar.gz
# RUN cp latest.tar.gz /var/www/wordpress
# RUN tar -xzf latest.tar.gz && mv wordpress/* ./
# RUN rm -rf latest.tar.gz  wordpress

# ENTRYPOINT ["tail", "-f", "/dev/null"]
# && mkdir /var/www/wordpress \
# && apt-get -y install php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline \
# && apt-get -y install php-mysql \
# && mkdir -p /var/www/wordpress \
