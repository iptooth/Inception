FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    curl \
    mariadb-client \
    php \
    php-fpm \
    php-cli \
    php-mysql \
    php-mysqli \
    redis \
    php-redis

RUN mkdir -p /var/www/html/wordpress
RUN mkdir -p /run/php/

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY ./tools/setup.sh /

ENTRYPOINT ["/setup.sh"]

