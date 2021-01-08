const jwt = require('jsonwebtoken');
const signature = '54ty95tvyety5i';

const validarToken = (req, res, next) => {
	const authHeader = req.headers.authorization;
	if (authHeader) {
		const token = authHeader.split(' ')[1];
		jwt.verify(token, signature, (err, user) => {
			if (err) {
				return res.sendStatus(403);
			}
			req.user = user;
			next();
		});
	} else {
		res.sendStatus(401);
	}
};

const signToken = (user, pass) => {

	return jwt.sign({user, pass}, signature);
}

module.exports = {
	validarToken,
	signToken
}
