damagePlayer = DamagePlayer2;

if(playerNumber) {
	controllerDevice = obj_DeviceManager.player1AssignedController;
}else {
	controllerDevice = obj_DeviceManager.player2AssignedController;
}

//Inputs
WeissPlayerInputs();

//Actualizar máquina de estados
WeissUpdateStateMachine();

//Actualizar posición
WeissUpdateMovement();