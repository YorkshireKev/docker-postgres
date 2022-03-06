Postgres Docker Image
===================

This is a minimal Alpine Linux (3.4) based progreSQL image. Unlike the official postgreSQL image, this one does not grant trust privileges to everyone.

You don't need to build this image yourself, you can pull a pre-built image from docker hub by typing:
`docker pull yorkshirekev/postgres:14`

https://hub.docker.com/r/yorkshirekev/postgres/

You will need to exec into the running contaner and create databases, password authenticated users etc:
`docker exec -it postgres psql postgres` (where the first postgres in the command is the container name).

Connect as a regular user:
`psql --host=localhost --user=myuser mydatabase`
