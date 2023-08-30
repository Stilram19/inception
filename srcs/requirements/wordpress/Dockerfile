# base image: the penultimate stable version of Debian

FROM debian:bullseye

EXPOSE 9000

# installing dependencies + useful packages

RUN apt update -y && apt upgrade -y \ 
&& apt install -y vim unzip wget php7.4 php7.4-fpm php7.4-mysql mariadb-client \
&& wget https://wordpress.org/latest.zip -P /var/www \
&& cd /var/www && unzip  latest.zip\
&& rm latest.zip \
&& chown -R root:root /var/www/wordpress \
&& wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
&& chmod +x wp-cli.phar \
&& mv wp-cli.phar /usr/local/bin/wp

# env variables for testing

ENV MDB_DATABASE=my_database
ENV MDB_USER=obednaou
ENV MDB_PASSWORD=pass123
ENV MDB_ROOT_PASSWORD=root123


# copying the config script to the container and giving it execute permission

COPY tools/wp_script.sh /home/wp_script.sh

RUN chmod +x /home/wp_script.sh

#CMD ["/home/wp_script.sh"]
