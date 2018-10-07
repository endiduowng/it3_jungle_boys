# Anime review, rating website use Rails


## How to run

### Ruby and Rails:

Setup development environment, link here: https://gorails.com/setup
Install mysql also is requied.

### Download and run it:

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
Create database:
```
$ rails db:migrate:reset
```
Seed some data to database:
```
$ rails db:seed
```
Run rails server:
```
$ rails server
```
Last, open browser to address: "localhost:3000"

Hope you enjoy it!
