# base image: the penultimate stable version of Debian
FROM debian:bullseye

RUN	apt update -y && apt upgrade -y \
        vsftpd

COPY conf/vsftpd.conf /etc/vsftpd.conf

COPY tools/script.sh /home/script.sh

RUN chmod +x /home/script.sh

CMD ["/home/script.sh"]
