const Sequelize = require('sequelize');
const db = require('../../config/database');

const User = db.define('user', {
	id: {
		type: Sequelize.INTEGER,
		field: 'id_users',
		primaryKey: true
	},
	fullname: {
		type: Sequelize.STRING
	},
	email: {
		type: Sequelize.STRING
	},
	address: {
		type: Sequelize.STRING
	},
	password: {
		type: Sequelize.STRING
	},
	is_admin: {
		type: Sequelize.BOOLEAN
	}
}, { timestamps: false });

User.sync().then(() => {
	console.log('table created');
});

module.exports = User;