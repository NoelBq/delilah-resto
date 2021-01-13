# **DELILAH REST0 API PROJECT**

**Manage your own take away and resto**

Delilah resto is an API that lets you manage users, products and orders from a restaurant or a take away shop, conecting to a MySQL database that stores and manage the resto's data.

## Features:

- Users' register and login.
- Role Validation (Admin or not)
- Products' CRUD functions
- Orders' CRUD functions

## Getting started
###  Clone the repository, install node packages 

```
//on local
git clone https://github.com/NoelBq/delilah-resto.git
npm install
```
## Database Set up:

- Run a MySQL server.

- Importing the Database
To import delilah dump file into MySQ, you will have to create the new database. This is where the contents of the dump file will be imported.

First, log in to the database as root or another user with sufficient privileges to create new databases:

```
mysql -u root -p

```
 
This will bring you into the MySQL shell prompt. Next, create a new database with the following command. In this example, the new database is called new_database:

```
CREATE DATABASE delilahresto;

``` 

You’ll see this output confirming that it was created.
Output
Query OK, 1 row affected (0.00 sec)
Then exit the MySQL shell by pressing CTRL+D. From the normal command line, you can import the dump file with the following command:

```
mysql -u username -p delilahresto < delilah-dump.sql
```
 
username is the username you can log in to the database with
newdatabase is the name of the freshly created database
data-dump.sql is the data dump file to be imported, located in the current directory
If the command runs successfully, it won’t produce any output. If any errors occur during the process, mysql will print them to the terminal instead. You can check that the database was imported by logging in to the MySQL shell again and inspecting the data. This can be done by selecting the new database with USE new_database and then using SHOW TABLES; or a similar command to look at some of the data.

## Getting Started

```
$ cd src
$ node index.js
```

## Open API

[Open Api](/spec.yml)
