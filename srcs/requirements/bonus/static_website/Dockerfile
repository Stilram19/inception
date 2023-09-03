# base image: the penultimate stable version of Debian
FROM debian:bullseye

EXPOSE 8080

RUN apt update -y && apt install -y python3

# create a directory for static website files 
RUN mkdir -p /var/www/html

# copy static website files into the container
COPY ./tools/yoga /var/www/html

WORKDIR /var/www/html

# run a web server to serve static files
CMD ["python3", "-m", "http.server", "8080"]
