const express = require('express');
const router = express.Router();
const checkPermission = require('../middlewares/checkPermissions');
const UserController = require('../controllers/UserController');

// Rota para deletar SuperUser
router.delete('/delete-superuser/:id', checkPermission('delete_superuser'), UserController.deleteUser);

// Rota para deletar Admin
router.delete('/delete-admin/:id', checkPermission('delete_admin'), UserController.deleteUser);

// Rota para deletar Usuário Comum
router.delete('/delete-user/:id', checkPermission('delete_user'), UserController.deleteUser);

module.exports = router;
