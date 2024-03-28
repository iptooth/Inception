FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    nodejs \
    npm

COPY ./conf /

ENTRYPOINT ["node", "/app.js"]
