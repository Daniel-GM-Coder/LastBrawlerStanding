damagePlayer = DamagePlayer1;

if(instance_number(obj_KnightPlayer2) > 0 && image_blend != c_lime)
	image_blend = c_lime;
	
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