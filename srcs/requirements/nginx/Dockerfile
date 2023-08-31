# base image: the penultimate stable version of Debian
FROM debian:bullseye

EXPOSE 443

# installing dependencies + useful packages
RUN apt -y update && apt install -y vim curl nginx openssl && \
    mkdir -p /var/www/resources && \
    mkdir -p /etc/nginx/ssl-config && \
    openssl req -x509 -nodes -out /etc/nginx/ssl-config/self-signed.crt \
        -keyout /etc/nginx/ssl-config/private.key \
        -subj "/C=MA/ST=MS/L=Marrakech/O=1337/OU=1337/CN=obednaou.42.fr/UID=obednaou"

# copying the nginx config file to its location inside the container
COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD [ "nginx", "-g", "daemon off;"]
