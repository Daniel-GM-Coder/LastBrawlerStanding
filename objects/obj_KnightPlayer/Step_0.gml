damagePlayer = DamagePlayer1;

if(playerNumber) {
	controllerDevice = obj_DeviceManager.player1AssignedController;
}else {
	controllerDevice = obj_DeviceManager.player2AssignedController;
}
//Inputs
KnightPlayerInputs();

//Actualizar máquina de estados
KnightUpdateStateMachine();

//Actualizar posición
KnightUpdateMovement();