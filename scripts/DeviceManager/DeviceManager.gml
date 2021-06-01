// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function getConnectedDevices(){
	var conectedDevices;
	var gp_num = gamepad_get_device_count();
	for (var i = 0; i < gp_num; i++;)
	    {
	    if gamepad_is_connected(i)
	        {
	        conectedDevices[i] = i;
	        }
	    }
	return conectedDevices;
}

