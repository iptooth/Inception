FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    iptables \
    fail2ban

RUN mkdir -p /var/log/fail2ban/ftp_logs
RUN mkdir /shared/

RUN sed -i 's/true/false/g' /etc/fail2ban/jail.d/defaults-debian.conf

COPY ./conf/vsftpd-docker-jail.conf /etc/fail2ban/jail.d/
COPY ./conf/vsftpd-docker-filter.conf /etc/fail2ban/filter.d/
COPY ./conf/vsftpd-docker-action.conf /etc/fail2ban/action.d/

ENTRYPOINT ["fail2ban-server", "-f", "-x"]


