if (keyboard_check_released(ord("Z")))
{
	audio_play_sound(MainMenuBack,2,false);
	room_goto(CharacterSelect)
}

if (gamepad_button_check_pressed(obj_DeviceManager.player1AssignedController, gp_face2))
{
	audio_play_sound(MainMenuBack,2,false);
	room_goto(CharacterSelect)
}

if keyboard_check_released(vk_right)
{
	audio_play_sound(MainMenuChange,2,false);
	seleccionMapa ++;
}

if keyboard_check_released(vk_left)
{
	audio_play_sound(MainMenuChange,2,false);
	seleccionMapa --;
}

if (gamepad_button_check_pressed(obj_DeviceManager.player1AssignedController, gp_padr))
{
	audio_play_sound(MainMenuChange,2,false);
	seleccionMapa ++;
}

if (gamepad_button_check_pressed(obj_DeviceManager.player1AssignedController, gp_padl))
{
	audio_play_sound(MainMenuChange,2,false);
	seleccionMapa --;
}
	
if (gamepad_button_check_pressed(obj_DeviceManager.player1AssignedController, gp_face1) && (firstTime == true))
{
	audio_play_sound(MainMenuAccept,2,false);
	alarm [0] = room_speed*2;
	firstTime = false;
}

if (keyboard_check_released(ord("B")))
{
	audio_play_sound(MainMenuAccept,2,false);
	alarm [0] = room_speed*2;
	firstTime = false;
}


if(seleccionMapa > 3)
	{seleccionMapa = 0;}

if(seleccionMapa < 0)
	{seleccionMapa = 3;}
	
myimage_index = (myimage_index + myimage_speed / (game_get_speed(gamespeed_fps) / sprite_get_speed(spr_Pj1_Select))) % sprite_get_number(spr_Pj1_Select);