const Order = require('../models/Order');
const OrdersProducts = require('../models/OrdersProducts');
const db = require('../../config/database');


const getOrder = async (req, res) => {
	const { user } = req.user;
	await db.authenticate();
	if (user.is_admin) {
		let result = await Order.findAll();
		return res.status(200).json(result);
	} else {
		res.status(405).json({error: "Needs to be admin to see Orders"});
	}
};

const getOrderByUserId =  async (req, res) => {
	const { user } = req.user;
	let result = await Order.findAll({ where: { user_id: user.id }});
	return res.status(200).json(result);
};

const updateOrderById =  async (req, res, next) => {
	const { user } = req.user;
	if (user.is_admin) {
		try {
			let result = await Order.update(
				{ status: req.body.status },
				{ returning: true, where: { id: req.params.id } },
				);
				res.status(200).end();
		} catch (e) {
			res.status(500).json(e);
		}
	} else {
		res.status(405).json({error: "Not admin"});
	}
}

const createOrder = async (req, res) => {
	const { user } = req.user;
	if (user) {
		try {
			let result = await Order.create(
				{ status: req.body.status,
				  paymentOption: req.body.paymentOption,
				  userId: user.id
				 },
				);
				let productIdArr = req.body.productsId;
				let arrInsertOrderProducts = productIdArr.map((el) => ({productId: el, orderId: result.id}));
				let bulkResult = await OrdersProducts.bulkCreate(arrInsertOrderProducts);
				res.status(200).json({ result, bulkResult}).end();
		} catch (e) {
			res.status(500).json(e.message);
		}
	} else {
		res.status(405).json({error: "Order not created"});
	}
}

module.exports = {
	getOrder,
	getOrderByUserId,
	updateOrderById,
	createOrder
}