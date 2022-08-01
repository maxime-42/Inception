#!/bin/sh


# echo "\nDownloading the Phar file to use wordpress commande line "
# curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# sleep 2

# echo "\nNext, check the Phar file to verify that it’s working:"
# php wp-cli.phar --info

# echo "\nExtract  wp-cli.phar"
# chmod +x wp-cli.phar 
# sleep 1
# echo "move wp-cli.phar to  /usr/local/bin/wp"
# mv wp-cli.phar /usr/local/bin/wp

# echo "If WP-CLI was installed successfully"
# wp --info
# sleep 1

wp core download --locale=fr_FR --allow-root

sleep 2

echo "\nSet right\n"
chown -R www-data:www-data /var/www/*
chmod -R 755 /var/www/*

echo "\nGenerates a wp-config.php file"
# wp config create --dbname=	WP_DATABASE_NAME --dbuser=$WP_DATABASE_USR --dbpass=$WP_DATABASE_PWD --dbhost=$MYSQL_HOST --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
wp config create --dbname=$MARIADB_DATABASE --dbuser=$WP_ADMIN_USER --dbpass=$WP_ADMIN_PWD --dbhost=$MARIADB_HOST  --dbcharset="utf8" --dbcollate="utf8_general_ci"  --allow-root

echo "\nInstall WordPress"
wp core install --url=url_example.com --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PWD --admin_email=$ADMIN_EMAIL --dbhost=$MARIADB_HOST  --allow-root
# echo "Success: WordPress installed successfully."

exec php-fpm7.3 -F
# tail -f /dev/null
# /bin/sh