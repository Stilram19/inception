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
&& wget https://github.com/wp-cli/wp-cli/releases/download/v2.8.1/wp-cli-2.8.1.phar -O wp-cli.phar \
&& chmod +x wp-cli.phar \
&& mv wp-cli.phar /usr/local/bin/wp \
&& mkdir -p /run/php

#&& wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
#&& chmod +x wp-cli.phar \
#&& mv wp-cli.phar /usr/local/bin/wp

# copying the config script to the container and giving it execute permission
COPY tools/wp_script.sh /home/wp_script.sh

# copying the www.conf config to the container
#COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN sed -i 's#listen = /run/php/php7.4-fpm.sock#listen = 0.0.0.0:9000#g' /etc/php/7.4/fpm/pool.d/www.conf
RUN sed -i 's#chdir = /var/www#chdir = /var/www/wordpress#g' /etc/php/7.4/fpm/pool.d/www.conf
RUN chmod +x /home/wp_script.sh

WORKDIR /var/www/wordpress

CMD ["/home/wp_script.sh"]
