/// @description Insert description here
// You can write your code in this editor
var deviceList = getConnectedDevices();

for(var i = 0; i < array_length_1d(deviceList); i++) {
	if (player1AssignedController == 999) {
		player1AssignedController = deviceList[i];
	}else if (player2AssignedController == 999) {
		player2AssignedController = deviceList[i];
	} else {
		break;
	}
}

