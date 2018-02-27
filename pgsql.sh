#!/bin/bash
# Install PostgreSQL and PGadmin3 by Flegma
if readlink /proc/$$/exe | grep -qs "dash"; then
    echo "Pokreni ovo sa './skripta.sh', a ne 'sh skripta.sh'."
    exit 1
fi

if [[ "$EUID" -ne 0 ]]; then
    echo "Pokreni ovo kao root, prvo 'sudo su'."
    exit 2
fi

echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" >> /etc/apt/sources.list.d/pgdg.list
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
apt-get update
apt-get install postgresql-contrib-9.6 postgresql-9.6 pgadmin3 php7.1-pgsql -y