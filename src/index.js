const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const port = 3000;
const { validarToken } = require("./middleware/tokenValidation");
const orderController = require('./controller/OrderController');
const productController = require('./controller/ProductController');
const userController = require('./controller/UserController');

app.use(bodyParser.urlencoded({
	extended: true
}));

app.use(bodyParser.json());

app.all('/api/*', validarToken);

// ORDERS
app.get('/api/orders', orderController.getOrder);
app.get('/api/orders/:userId', orderController.getOrderByUserId);
app.put('/api/order/:id', orderController.updateOrderById);
app.post('/api/order', orderController.createOrder);
app.delete('/api/order/:id', orderController.deleteOrderById);


// PRODUCT
app.get('/api/products', productController.getProducts);
app.get('/api/product/:id', productController.getProductById);
app.put('/api/product/:id', productController.updateProductById);
app.delete('/api/product/:id', productController.deleteProductById);
app.post('/api/product', productController.createProduct);

//USERS
app.get('/api/users', userController.getUsers);
app.post('/login',userController.login);
app.post('/signup', userController.signUp);

app.listen(port, () => {
	console.log(`Example app listening at http://localhost:${port}`)
})