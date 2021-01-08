const { Model, DataTypes } = require("sequelize");
const db = require('../../config/database');

class Order extends Model {}
Order.init({
	paymentOption: DataTypes.STRING,
	status: DataTypes.STRING,
	userId: DataTypes.INTEGER
}, { sequelize: db, 
	tableName: 'orders', 
	underscored: true, updatedAt: false, deletedAt: false 
});

module.exports = Order;