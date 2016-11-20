FROM alpine:3.4
MAINTAINER Kevin Ellis

ENV LAST_MODIFIED "2016-11-19 K Ellis"

RUN apk add --update 'postgresql<9.5.5' && rm -rf /var/cache/apk/*

# Expose main runtime data files as volume for performance and backups
#####VOLUME /var/lib/postgresql/9.3/main

# Security config, to allow for password authentication etc.
ADD postgresql.conf /usr/share/postgresql/postgresql.conf
ADD pg_hba.conf /usr/share/postgresql/pg_hba.conf
RUN mkdir /data && chown postgres:postgres /data && chmod 0700 /data

#RUN chown postgres:postgres /usr/share/postgresql/pg_hba.conf
#RUN chown postgres:postgres /usr/share/postgresql/postgresql.conf
#RUN export LANGUAGE=en_GB.UTF-8
#RUN export LANG=en_GS.UTF-8
#RUN export LC_ALL=en_GB.UTF-8
#RUN locale-gen en_GB.UTF-8
#RUN dpkg-reconfigure locales

EXPOSE 5432

USER postgres
RUN initdb /data

CMD ["/usr/bin/postgres", "-D", "/data"]