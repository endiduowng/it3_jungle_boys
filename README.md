# Anime review, rating website use Rails


## How to run

### Setup development environment:

Go here: https://gorails.com/setup, choose your OS's version and following instructions to install Ruby, Rails and MySQL.

### Download source code, library:

Download source code and open terminal inside it:
```
$ cd it3_jungle_boys
```
First, in config folder rename database.yml.example to database.yml, secrets.yml.example to secrets.yml:
```
$ mv config/database.yml.example config/database.yml
$ mv config/secrets.yml.example config/secrets.yml
```
Then install library:
```
$ bundle install
```

### Create database, table and data
Update MySQL's username, password to file database.yml (line 16, 17)

Create database:
```
$ rails db:create
```
Create tables using migration:
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
