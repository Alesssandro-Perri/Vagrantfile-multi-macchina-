sudo apt-get update -y
sudo apt-get install apache2 -y
sudo apt-get install php libapache2-mod-php php-mysql -y
sudo a2enmod rewrite
sudo service apache2 restart

