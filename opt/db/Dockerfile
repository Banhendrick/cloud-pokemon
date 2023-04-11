FROM mysql:8.0.32

WORKDIR /var/lib/mysql

ENV MYSQL_ROOT_PASSWORD root

COPY database.sql /docker-entrypoint-initdb.d

#necesario para kubernetes?
#EXPOSE 3306

