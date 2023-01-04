FROM debian:buster

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install mariadb-server -y
RUN apt-get install bash -y


COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY conf/auto_config.sh /auto_config.sh

# ==> Execute the bash script to create the database and the user
ENTRYPOINT ["bash", "auto_config.sh"]

# ==> Expose the only port allowed by the subject (MySQL)
EXPOSE 3306
