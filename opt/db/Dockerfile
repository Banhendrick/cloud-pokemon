FROM mysql:8.0.32

WORKDIR /var/lib/mysql

#--default-authentication-plugin=mysql_native_password --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci

ENV MYSQL_ROOT_PASSWORD root

COPY database.sql /docker-entrypoint-initdb.d

#necesario para kubernetes?
#EXPOSE 3306

