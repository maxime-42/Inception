FROM debian:buster
LABEL maintainer="mkayumba@student.42.fr"
RUN apt-get update \
&& apt-get -y upgrade \ 
&& apt-get -y install nginx



RUN mkdir /var/www/wordpress
COPY ./nginx.conf  /etc/nginx/sites-available/default

RUN apt-get  install openssl && openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt \
-subj "/C=US/ST=Utah/L=Lehi/O=Your Company, Inc./OU=IT/CN=yourdomain.com"


EXPOSE 80
EXPOSE 443
ENTRYPOINT ["nginx", "-g", "daemon off;"]