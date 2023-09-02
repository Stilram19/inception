# base image: the penultimate stable version of Debian
FROM debian:bullseye

EXPOSE 3306

# installing dependencies + useful packages
RUN apt update -y && apt upgrade -y && apt install -y vim mariadb-server

# copying the runtime script to the container
COPY tools/script.sh /home/script.sh

RUN chmod +x /home/script.sh

CMD ["/home/script.sh"]
