// middlewares/checkPermissions.js
function checkPermission(requiredPermission) {
    return (req, res, next) => {
        const userPermissions = req.user.permissions; // Assume que as permissões do usuário logado estão disponíveis
        if (userPermissions.includes(requiredPermission)) {
            next();
        } else {
            return res.status(403).json({ message: 'Acesso negado: Permissão insuficiente.' });
        }
    };
}

module.exports = checkPermission;
