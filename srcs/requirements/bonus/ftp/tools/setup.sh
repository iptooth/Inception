#!/bin/bash

/monitoring.sh &
service vsftpd start

useradd -m ${FTP_USER}
echo ${FTP_USER}:${FTP_USER_PASSWORD} | /usr/sbin/chpasswd
chown -R ${FTP_USER}:${FTP_USER} /home/${FTP_USER}/
echo ${FTP_USER} >> /etc/vsftpd.userlist
service vsftpd stop

/usr/sbin/vsftpd