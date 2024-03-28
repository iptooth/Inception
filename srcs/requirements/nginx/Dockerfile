FROM debian:bullseye

COPY ./conf/nginx.conf /etc/nginx/sites-available/nginx.conf
COPY ./tools/setup.sh /

RUN chmod +x /setup.sh && \
    ./setup.sh

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]