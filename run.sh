docker run -d -p 5432:5432 \
--restart=always \
--name postgresql \
--log-opt max-size=100k --log-opt max-file=10 \
--memory=256M \
yorkshirekev/postgres:9.5
