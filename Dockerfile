FROM ubuntu:14.04
MAINTAINER Kevin Ellis

ENV LAST_MODIFIED "2014-09-03 K Ellis"

RUN apt-get update
RUN apt-get install postgresql-9.3 -y

# Expose main runtime data files as volume for performance and backups
VOLUME /var/lib/postgresql/9.3/main

# Security config, to allow for password authentication etc.
ADD postgresql.conf /etc/postgresql/9.3/main/postgresql.conf
ADD pg_hba.conf /etc/postgresql/9.3/main/pg_hba.conf
RUN chown postgres:postgres /etc/postgresql/9.3/main/pg_hba.conf
RUN chown postgres:postgres /etc/postgresql/9.3/main/postgresql.conf

RUN export LANGUAGE=en_GB.UTF-8
RUN export LANG=en_GS.UTF-8
RUN export LC_ALL=en_GB.UTF-8
RUN locale-gen en_GB.UTF-8
RUN dpkg-reconfigure locales

EXPOSE 5432

USER postgres

CMD ["/usr/lib/postgresql/9.3/bin/postgres", "-D", "etc/postgresql/9.3/main/"]
