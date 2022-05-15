FROM mysql:8-debian

COPY ./dump.sql /

COPY ./script_.sh /docker-entrypoint-initdb.d

COPY ./my.cnf /etc/mysql

RUN apt-get update

ENV MYSQL_ROOT_PASSWORD 777777

EXPOSE 3306/tcp