FROM alpine:3.4
MAINTAINER Kevin Ellis

ENV LAST_MODIFIED "2016-11-19 K Ellis"

RUN apk add --update 'postgresql<9.5.5' && rm -rf /var/cache/apk/*

# Security config, to allow for password authentication etc.
ADD postgresql.conf /usr/share/postgresql/postgresql.conf.sample
ADD pg_hba.conf /usr/share/postgresql/pg_hba.conf.sample
RUN mkdir /data && chown postgres:postgres /data && chmod 0700 /data

# Expose main runtime data files as volume for performance and backups
#VOLUME /data

EXPOSE 5432

USER postgres
RUN initdb /data

CMD ["/usr/bin/postgres", "-D", "/data"]
