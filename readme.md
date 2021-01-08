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
npm start
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
CREATE DATABASE new_database;

``` 

You’ll see this output confirming that it was created.
Output
Query OK, 1 row affected (0.00 sec)
Then exit the MySQL shell by pressing CTRL+D. From the normal command line, you can import the dump file with the following command:

```
mysql -u username -p new_database < delilah-dump.sql
```
 
username is the username you can log in to the database with
newdatabase is the name of the freshly created database
data-dump.sql is the data dump file to be imported, located in the current directory
If the command runs successfully, it won’t produce any output. If any errors occur during the process, mysql will print them to the terminal instead. You can check that the database was imported by logging in to the MySQL shell again and inspecting the data. This can be done by selecting the new database with USE new_database and then using SHOW TABLES; or a similar command to look at some of the data.

## Available endpoints

#### ORDERS

##### GET api/orders
Requires login as admin
Returns 200 
An array with a list of orders 

```
[
    {
        "id": 1,
        "paymentOption": "cash",
        "status": "procesando",
        "userId": 4,
        "createdAt": "2020-11-22T21:22:14.000Z"
    },
    {
        "id": 2,
        "paymentOption": "cash",
        "status": "nuevo",
        "userId": 4,
        "createdAt": "2020-11-22T21:22:14.000Z"
    },
    {
        "id": 3,
        "paymentOption": "card",
        "status": "nuevo",
        "userId": 6,
        "createdAt": "2020-11-22T21:22:14.000Z"
    }
]
```

##### GET api/orders/:userId

Returns 200 
An array with a list of orders of the user

```
[
    {
        "id": 1,
        "paymentOption": "cash",
        "status": "procesando",
        "userId": 4,
        "createdAt": "2020-11-22T21:22:14.000Z"
    },
    {
        "id": 2,
        "paymentOption": "cash",
        "status": "nuevo",
        "userId": 4,
        "createdAt": "2020-11-22T21:22:14.000Z"
    }
]
```

#### PUT api/order/:orderId

Requires login as admin
Returns 200  OK
Returns 405 if not admin 

#### POST api/order

Returns 200 OK
Returns 405 if not created

### PRODUCTS

#### GET api/products

Returns 200 OK
An array of products 

```
[
    {
        "idProducts": 1,
        "productName": "Bagel JyQ",
        "price": "607",
        "productImage": "https://i.imgur.com/6DIye2w.jpeg"
    },
    {
        "idProducts": 2,
        "productName": "Hamburguesa Clasica",
        "price": "350",
        "productImage": "https://i.imgur.com/L5IhOun.png"
    }]

```

#### GET api/products/:id
Requires Admin
Returns 200  OK and the product 
```
{
    "idProducts": 2,
    "productName": "Hamburguesa Clasica",
    "price": "350",
    "productImage": "https://i.imgur.com/L5IhOun.png"
}

```
Returns 405 if not admin 

#### PUT api/product/:id

Requires Admin
Returns 200  OK 
Returns 405 if not admin 

#### POST api/product

Requires Admin
Returns 200  OK 
Returns 405 if not admin 


#### DELETE api/product/:id

Requires Admin
Returns 200  OK 
Returns 405 if not admin 

### USER

app.get('/api/users', userController.getUsers);
app.post('/login',userController.login);
app.post('/signup', userController.signUp);

#### GET api/users

Requires Admin
Returns 200  OK 
An array with a list of users

```
[
  {
        "id": 5,
        "fullname": "Jules",
        "email": "Jules@hotmail.com",
        "address": "blabla 1236686",
        "password": "123456",
        "is_admin": false
    },
    {
        "id": 6,
        "fullname": "Nuevo user",
        "email": "loecita2@hotmail.com",
        "address": "test address 1234",
        "password": "1234456",
        "is_admin": false
    },
    {
        "id": 7,
        "fullname": "Robert Ricard",
        "email": "robert@hotmail.com",
        "address": "test address 1234",
        "password": "1234456",
        "is_admin": false
    },
    {
        "id": 8,
        "fullname": "Richard Jupiter",
        "email": "richard@hotmail.com",
        "address": "test address 1234",
        "password": "1234456",
        "is_admin": false
    }
]

```
Returns 405 if not admin 

#### POST /login

Returns 200 OK
Returns 405 for wrong  password or user 

#### POST /signup

Returns 201 OK
Returns 500 for errors
