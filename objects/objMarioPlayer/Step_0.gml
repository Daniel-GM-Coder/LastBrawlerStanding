damagePlayer = DamagePlayer1;

if(instance_number(objMarioPlayer2) > 0 && image_blend != c_lime)
	image_blend = c_lime;

if(playerNumber) {
	controllerDevice = obj_DeviceManager.player1AssignedController;
}else {
	controllerDevice = obj_DeviceManager.player2AssignedController;
}

//Inputs
PlayerInputsMario();

//Actualizar máquina de estados
UpdateStateMachineMario();

//Actualizar posición
UpdateMovementMario();