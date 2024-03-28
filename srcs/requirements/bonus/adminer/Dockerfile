# Base image
FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y \
    curl \
    php7.4 \
    php7.4-mysql \
    php7.4-mysqli

RUN mkdir -p /usr/src/adminer && \
    curl -L https://www.adminer.org/latest.php -o /usr/src/adminer/index.php

CMD ["php", "-S", "0.0.0.0:8080", "-t", "/usr/src/adminer"]
