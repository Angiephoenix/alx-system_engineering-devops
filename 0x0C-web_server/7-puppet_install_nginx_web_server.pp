#!/usr/bin/env bash
# Transfers a file from our client to a server:
# Usage: 0-transfer_file PATH_TO_FILE IP USERNAME PATH_TO_SSH_KEY

if [ "${#}" -eq 4 ]
then
    PATH_TO_FILE="${1}"
    IP="${2}"
    USERNAME="${3}"
    PATH_TO_SSH_KEY="${4}"

    scp -o StrictHostKeyChecking=no -i "${PATH_TO_SSH_KEY}" "${PATH_TO_FILE}" "${USERNAME}"@"${IP}":~/
else
    echo 'Usage: 0-transfer_file PATH_TO_FILE IP USERNAME PATH_TO_SSH_KEY'
fi
Mubaraq Abuhasan5:31 PM
# Installs a Nginx server

exec {'install':
  provider => shell,
  command  => 'sudo apt-get -y update ; sudo apt-get -y install nginx ; echo "Hello World!" | sudo tee /var/www/html/index.nginx-debian.html ; sudo sed -i "s/server_name _;/server_name _;\n\trewrite ^\/redirect_me https:\/\/github.com\/luischaparroc permanent;/" /etc/nginx/sites-available/default ; sudo service nginx start',
}

