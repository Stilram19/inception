# base image: the penultimate stable version of Debian
FROM debian:bullseye

RUN	apt update -y && apt upgrade -y \
        vsftpd

COPY conf/vsftpd.conf /etc/vsftpd.conf

#COPY tools/server_ftp.sh /home/server_ftp.sh

#CMD ["/home/server_ftp.sh"]