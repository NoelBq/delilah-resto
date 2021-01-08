const User = require('../models/User');
const db = require('../../config/database');
const userValidation = require("../middleware/userValidation");
const { validarToken, signToken } = require("../middleware/tokenValidation");

const getUsers = async (req, res) => {
	const { user } = req.user;
	await db.authenticate();
	if (user.is_admin) {
		let result = await User.findAll();
		return res.status(200).json(result);
	} else {
		res.status(405).json({error: "Needs to be admin to see list of users"});
	}
}

const createUser = async (email, password, fullname, address) => {
    try {
        return await User.create({ email, password, fullname, address, is_admin: 0 })
    } catch (error) {
        console.error('Unable to connect to the database:', error);
    }
}

const login = async (req, res) => {
    const {email, pass} = req.body;
    const user = await userValidation.validarUsuarioPass(email, pass);
    if (!user) {
        res.status(405).json({error: 'usuario o contrasena incorrecta'});
        return;
    }
    const token = signToken(user, pass);
    res.status(200).json({token});
}

const signUp = async (req, res) => {
    const {email, password, fullname, address} = req.body;
    const user = await createUser(email, password, fullname, address);
    if (!user) {
        res.status(500).json({error: 'No se pudo registrar usuario'});
    }
    res.status(201).json(user)
}

module.exports = {
    getUsers,
    createUser,
    login,
    signUp
}