Postgres Docker Image
===================

This is a minimal Ubuntu 14.04 based progreSQL image. Unlike the official image, this one does not grant trust privileges to everyone.

You don't need to build this image yourself, you can pull a pre-built image from docker hub by typing:
`docker pull yorkshirekev/postgres`

You will need to use something like nsenter (see [here](http://www.kevssite.com/2014/08/05/console-access-into-a-running-docker-container/) for a quick guide on how to use nsenter) to configure the database and create password authenticated users.

When inside the container, you can login as the superuser, postgres with the follwing command:
`su postgres -c psql`

Connect as a regular user:
`psql --host=localhost --user=myuser mydatabase`
