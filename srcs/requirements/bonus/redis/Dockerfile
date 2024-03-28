FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    redis

COPY /conf/redis.conf /etc/redis/

ENTRYPOINT ["redis-server", "--protected-mode", "no"]