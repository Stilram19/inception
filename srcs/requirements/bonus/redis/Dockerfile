# base image: the penultimate stable version of Debian
FROM debian:bullseye

EXPOSE 6379

RUN apt update -y && apt install -y redis

COPY tools/script.sh /home/script.sh

RUN chmod +x /home/script.sh

CMD ["/home/script.sh"]
