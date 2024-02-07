sudo apt-get update -y
sudo apt-get install mysql-server -y 

sudo sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mysql.conf.d/mysqld.cnf

#CREAZIONE UTENTE
sudo mysql -e "CREATE USER 'user'@'10.10.20.10' IDENTIFIED BY 'Password&1';"
sudo mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'user'@'10.10.20.10';"

#CREAZIONE DATABASE
sudo mysql -e "CREATE DATABASE mioDatabase;"
sudo mysql -e "USE mioDatabase; CREATE TABLE Persone (ID INT PRIMARY KEY, Nome VARCHAR(20), Cognome VARCHAR(20), Eta INT);"
sudo mysql -e "USE mioDatabase; INSERT INTO Persone (ID, Nome, Cognome, Eta) VALUES (1, 'Alessandro', 'Perri', 18), (2, 'Alex', 'Ierardi', 18), (3, 'Diego', 'Muniz', 19);"

sudo service mysql restart
