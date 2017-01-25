sqitch database to handle utentes-db

How to install it:

$ psql -h localhost -U postgres -c "CREATE ROLE utentes LOGIN PASSWORD 'XXXX'"
$ echo "" >> ~/.pgpass
$ echo "*:*:*:utentes:XXXX" >> ~/.pgpass
$ createdb -h localhost -U postgres -T template0 --owner utentes aranorte
$ sqitch deploy
