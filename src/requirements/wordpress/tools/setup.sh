#!/bin/bash

if [ "$(ls -A /var/www/html/wordpress)" ]; then
    echo "WordPress directory is not empty. Skipping installation."
else
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar 
    mv wp-cli.phar /usr/local/bin/wp

    cd /var/www/html/wordpress
    rm -rf /var/www/html/wordpress/*

    wp core download    --path=/var/www/html/wordpress \
                        --allow-root

    wp config create    --path=/var/www/html/wordpress \
                        --dbname=${MYSQL_DATABASE} \
                        --dbuser=${MYSQL_USER} \
                        --dbpass=${MYSQL_USER_PASSWORD} \
                        --dbhost=${MYSQL_HOSTNAME} \
                        --skip-check \
                        --allow-root

    wp core install --path=/var/www/html/wordpress \
                    --url=${DOMAIN} \
                    --title=${WP_TITLE} \
                    --admin_user=${WP_ADMIN_USER} \
                    --admin_password=${WP_ADMIN_USER_PASSWORD} \
                    --admin_email=${WP_ADMIN_EMAIL} \
                    --allow-root

    wp user create  ${WP_USER} \
                    ${WP_USER_EMAIL} \
                    --user_pass=${WP_USER_PASSWORD} \
                    --allow-root

    wp theme install astra --activate --allow-root

    wp config set WP_REDIS_HOST redis --add --allow-root
    wp config set WP_REDIS_PORT 6379 --add --allow-root  
    wp config set WP_CACHE true --add --allow-root  
    wp plugin install redis-cache --activate --allow-root
    wp plugin update --all --allow-root
    wp redis enable --allow-root  

    chown -R www-data:www-data /var/www/html/wordpress
fi

/usr/sbin/php-fpm7.4 -F
