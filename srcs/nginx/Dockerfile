FROM debian:buster
LABEL maintainer="mkayumba@student.42.fr"
RUN apt-get update \
&& apt-get -y upgrade \ 
&& apt-get -y install nginx

# RUN apt-get  install openssl && openssl req -new \
# -newkey rsa:2048 -nodes -keyout yourdomain.key \
# -out yourdomain.csr \
# -subj "/C=US/ST=Utah/L=Lehi/O=Your Company, Inc./OU=IT/CN=yourdomain.com"


RUN mkdir /var/www/wordpress
COPY ./nginx.conf  /etc/nginx/sites-available/default
# RUN service nginx restart
EXPOSE 80
EXPOSE 443
ENTRYPOINT ["nginx", "-g", "daemon off;"]