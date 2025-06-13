!#/bin/bash

rm -rf insecurity
rm insecurity.tar.gz
wget https://edshare.gcu.ac.uk/id/document/59385 -O insecurity.tar.gz
tar -xzvf insecurity.tar.gz
mysql -u root -pdojo < ./insecurity/security.sql
rm ./insecurity/security.sql
sudo rm -rf /var/www/insecurity
sudo cp -R ./insecurity /var/www/
sudo chown -R www-data:www-data /var/www/insecurity
sudo chmod -R o+x /var/www/insecurity
rm -rf insecurity
rm insecurity.tar.gz
firefox http://targets.local/insecurity/login.php
