/// @description Insert description here
// You can write your code in this editor
deviceList = getConnectedDevices();

for(var i = 0; i < array_length_1d(deviceList); i++) {
	if (player1AssignedController == 999 && i != player2AssignedController) {
		player1AssignedController = deviceList[i];
	}else if (player2AssignedController == 999 && i != player1AssignedController) {
		player2AssignedController = deviceList[i];
	} else {
		break;
	}
}

