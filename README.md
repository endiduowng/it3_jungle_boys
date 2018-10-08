# Anime review, rating website use Rails


## How to run

### Setup development environment:

Go here: https://gorails.com/setup, choose your OS's version and following instructions to install Ruby, Rails and MySQL.

### Download source code, library:

Download source code and open terminal inside it:
```
$ cd it3_jungle_boys
```
First, rename database.yml.example to database.yml
```
$ mv config/database.yml.example config/database.yml
```
Then install library:
```
$ bundle install
```
### Create database

Log in to MySQL as the root user:
```
$ mysql -u root -p
```
Type the MySQL root password, and then press Enter.

In MySQL tool create new user.(replace 'username' and 'password' to whatever you want):
```
mysql> GRANT ALL PRIVILEGES ON *.* TO 'username'@'localhost' IDENTIFIED BY 'password';
```
Type \q to exit the mysql program.

To log in to MySQL as the user you just created, type the following command:
```
$ mysql -u username -p
```
Type the user's password, and then press Enter.

To create a database, type the following command.
```
mysql> CREATE DATABASE itnihongo3_development;
```
Type \q to exit the mysql program.

Update MySQL username, password to database.yml (line 16, 17) 

### Create table and data
Create database's tables using migration:
```
$ rails db:migrate
```
Seed some data to database:
```
$ rails db:seed
```
### Server
Finally, run rails server:
```
$ rails server
```
Open browser and go to address: "localhost:3000"

Hope you enjoy it!
