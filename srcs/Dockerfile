FROM debian:buster
LABEL maintainer="mkayumba@student.42.fr"
RUN apt-get update \
&& apt-get -y upgrade \ 
&& apt-get -y install nginx

RUN mkdir /var/www/wordpress
COPY ./to_importe/nginx.conf  /etc/nginx/sites-available/default
COPY ./to_importe/index.html /var/www/wordpress

RUN service nginx restart
EXPOSE 80
EXPOSE 443
ENTRYPOINT ["nginx", "-g", "daemon off;"]