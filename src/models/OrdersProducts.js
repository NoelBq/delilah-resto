const { Model, DataTypes } = require("sequelize");
const db = require('../../config/database');
const Order = require('./Order');
const Product = require('./Product');

class OrdersProducts extends Model {}
OrdersProducts.init({
	orderId: {
		type: DataTypes.INTEGER,
		references: {
			model: 'Order',
			key: 'orderId'
		}
	},
	productId: {
		type: DataTypes.INTEGER,
		references: {
			model: 'Product',
			key: 'productId'
		}
	},
}, { sequelize: db, 
	tableName: 'order__products', 
	underscored: true,
	updatedAt: false, 
	deletedAt: false, 
	createdAt: false
	
});

OrdersProducts.removeAttribute('id');

module.exports = OrdersProducts;