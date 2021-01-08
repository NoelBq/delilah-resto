const User = require('../models/User')

const validarUsuarioPass = async (email, pass) => {
	try {
		return await User.findOne({ where: { email: email, password: pass }});
	} catch (error) {
		console.error('Unable to connect to the database:', error);
	}
}

module.exports = {
    validarUsuarioPass
}