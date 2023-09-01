# base image: the penultimate stable version of Debian
FROM debian:bullseye

EXPOSE 3306

# installing dependencies + useful packages
RUN apt update -y && apt upgrade -y && apt install -y vim mariadb-server

#ENV MDB_DATABASE=my_database
#ENV MDB_USER=obednaou
#ENV MDB_PASSWORD=pass123
#ENV MDB_ROOT_PASSWORD=root123

# copying the mariadb server config file to its location inside the container
#COPY conf/50-server.cnf	/etc/mysql/my.cnf
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# copying the runtime script to the container
COPY tools/script.sh /home/script.sh

RUN chmod +x /home/script.sh

CMD ["/home/script.sh"]
