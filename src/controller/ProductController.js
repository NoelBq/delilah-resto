const Product = require("../models/Product");
const db = require('../../config/database');
const User = require('../models/User');

const getProducts =  async (req, res) => {
	await db.authenticate();
	let result = await Product.findAll();
	return res.status(200).json(result);
}

const getProductById = async (req, res) => {
	const { user } = req.user;
	await db.authenticate();
	if (user.is_admin) {
		let result = await Product.findOne({where: {id_products: req.params.id}});
		return res.status(200).json(result);
	} else {
		res.status(405).json({error: "Needs to be admin to see ProductById"});
	}
};

const updateProductById =  async (req, res, next) => {
	const { user } = req.user;
	if (user.is_admin) {
		try {
			let result = await Product.update({ 
					price: req.body.price, 
					productName: req.body.productName,
					productImage: req.body.productImage
				}, { where: { id_products: req.params.id} },
			);
				res.status(200).end();
			} catch (e) {
				res.status(500).json(e.message);
			}
		} else {
			res.status(405).json({error: "Not admin"});
		}
	}

	const createProduct =  async (req, res, next) => {
		const { user } = req.user;
		if (user.is_admin) {
			try {
				let result = await Product.create({ 
						price: req.body.price, 
						productName: req.body.productName,
						productImage: req.body.productImage
					},
				);
					res.status(200).end();
				} catch (e) {
					res.status(500).json(e.message);
				}
			} else {
				res.status(405).json({error: "Not admin"});
			}
		}
	
	const deleteProductById = async (req, res) => {
		const { user } = req.user;
		await db.authenticate();
		if (user.is_admin) {
			let result = await Product.destroy({where: {id_products: req.params.id}});
			return res.status(200).json(result);
		} else {
			res.status(405).json({error: "Needs to be admin to delete a product"});
		}
	};


	module.exports = {
		getProducts,
		getProductById,
		updateProductById,
		deleteProductById,
		createProduct
	}