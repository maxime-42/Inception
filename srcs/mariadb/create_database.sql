CREATE DATABASE wordpress;
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';
GRANT ALL ON wordpress.* TO 'admin'@'localhost' IDENTIFIED BY 'admin' WITH GRANT OPTION;
FLUSH PRIVILEGES;