damagePlayer = DamagePlayer2;

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