## Databases

### Postgresql

(from https://www.postgresql.org/download/linux/ubuntu/)

sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get -y install postgresql

### MariaDB

(from https://mariadb.com/kb/en/mariadb-package-repository-setup-and-usage/ )

apt install mariadb-server-10.5

## etc

## docker containers