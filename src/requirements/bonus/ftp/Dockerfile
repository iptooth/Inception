FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    vsftpd \
    iptables

COPY ./conf/vsftpd.conf /etc/
COPY ./tools/setup.sh /
COPY ./tools/monitoring.sh /

RUN chmod +x /setup.sh
RUN chmod +x /monitoring.sh

RUN mkdir /shared/

EXPOSE 21

ENTRYPOINT ["/bin/bash", "-c"]
CMD ["/setup.sh"]

