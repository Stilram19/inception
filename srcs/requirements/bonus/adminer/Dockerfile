# base image: the penultimate stable version of Debian
FROM debian:bullseye

EXPOSE 80

RUN apt update && \
    apt install -y curl php php-mysql php-cli

RUN mkdir -p /var/www/html/adminer && \
    curl -L https://www.adminer.org/latest-mysql-en.php -o /var/www/html/adminer/index.php

CMD ["php", "-S", "0.0.0.0:80", "-t", "/var/www/html/adminer"]
