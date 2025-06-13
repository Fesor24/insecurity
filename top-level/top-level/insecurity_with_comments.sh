#!/bin/bash

# Remove the directory 'insecurity' and all its contents, if it exists
rm -rf insecurity

# Remove the file 'insecurity.tar.gz', if it exists
rm insecurity.tar.gz

# Download a tar.gz file from the specified URL and save it as 'insecurity.tar.gz'
wget https://edshare.gcu.ac.uk/id/document/59385 -O insecurity.tar.gz

# Extract the contents of the 'insecurity.tar.gz' archive into the current directory
tar -xzvf insecurity.tar.gz

# Import the 'security.sql' file into MySQL using the root user with password 'dojo'
mysql -u root -pdojo < ./insecurity/security.sql

# Remove the 'security.sql' file after importing it into the MySQL database
rm ./insecurity/security.sql

# Remove the existing '/var/www/insecurity' directory, if it exists
sudo rm -rf /var/www/insecurity

# Copy the extracted 'insecurity' directory to '/var/www/'
sudo cp -R ./insecurity /var/www/

# Change the ownership of '/var/www/insecurity' to the 'www-data' user and group
sudo chown -R www-data:www-data /var/www/insecurity

# Change permissions on '/var/www/insecurity' to allow others to execute files
sudo chmod -R o+x /var/www/insecurity

# Remove the 'insecurity' directory and its contents from the current directory
rm -rf insecurity

# Remove the 'insecurity.tar.gz' file from the current directory
rm insecurity.tar.gz

# Open the login page of the 'insecurity' app in Firefox
firefox http://targets.local/insecurity/login.php
