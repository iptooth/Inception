#!/bin/bash

apt-get update && apt-get install nginx openssl apache2-utils -y

openssl req \
        -x509 \
        -nodes \
        -days 365 \
        -newkey rsa:4096 \
        -keyout /etc/ssl/private/nginx-selfsigned.key \
        -out /etc/ssl/certs/nginx-selfsigned.crt \
        -subj "/C=FR/ST=Grand Est/L=Mulhouse/O=42/OU=Haut-Rhin/CN=nlence-l.42.fr"

ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf

