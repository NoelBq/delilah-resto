const Sequelize = require('sequelize');
const { Model, DataTypes } = require("sequelize");
const db = require('../../config/database');

class Product extends Model {}
Product.init({
	idProducts: {
		type: DataTypes.INTEGER,
		primaryKey: true,
	},  
	productName: {
		type: DataTypes.STRING,
		allowNull: false
	},
	price: {
		type: DataTypes.INTEGER,
		allowNull: false
	},
	productImage: {
		type: DataTypes.STRING,
		allowNull: false
	}

}, { sequelize: db, 
	tableName: 'products',
	underscored: true,
	updatedAt: false,
	deletedAt: false,
	createdAt: false
});

module.exports = Product;

