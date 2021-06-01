if (fijadoPJ1 == true)
{
	if gamepad_button_check_pressed(obj_DeviceManager.player1AssignedController, gp_face2)
	{
		audio_play_sound(MainMenuBack,2,false);
		fijadoPJ1 = false;
	}
}
else
{
	if gamepad_button_check_pressed(obj_DeviceManager.player1AssignedController, gp_padd)
	{
		audio_play_sound(MainMenuChange,2,false);
		seleccionPJ1 ++;
	}

	if gamepad_button_check_pressed(obj_DeviceManager.player1AssignedController, gp_padu)
	{
		audio_play_sound(MainMenuChange,2,false);
		seleccionPJ1 --;
	}
	
	if gamepad_button_check_pressed(obj_DeviceManager.player1AssignedController, gp_face1)
	{
		audio_play_sound(MainMenuAccept,2,false);
		fijadoPJ1 = true;
	}
}


if (fijadoPJ2 == true)
{
	if gamepad_button_check_pressed(obj_DeviceManager.player2AssignedController, gp_face2)
	{
		audio_play_sound(MainMenuBack,2,false);
		fijadoPJ2 = false;
	}
}
else
{
	if gamepad_button_check_pressed(obj_DeviceManager.player2AssignedController, gp_padd)
	{
		audio_play_sound(MainMenuChange,2,false);
		seleccionPJ2 ++;
	}

	if gamepad_button_check_pressed(obj_DeviceManager.player2AssignedController, gp_padu)
	{
		audio_play_sound(MainMenuChange,2,false);
		seleccionPJ2 --;
	}
	if gamepad_button_check_pressed(obj_DeviceManager.player2AssignedController, gp_face1)
	{
		audio_play_sound(MainMenuAccept,2,false);
		fijadoPJ2 = true;
	}
	if keyboard_check(ord("B"))
	{
		audio_play_sound(MainMenuAccept,2,false);
		fijadoPJ2 = true;
	}
}

if ((fijadoPJ1 == false) && (fijadoPJ2 == false))
{
	if gamepad_button_check_pressed(obj_DeviceManager.player1AssignedController, gp_face2)
	{
		room_goto(MainMenu);
	}
}
if ((fijadoPJ1 == true) && (fijadoPJ2 == true) && (firstTime == true))
{
	alarm [0] = room_speed*2;
	firstTime = false;
}

if (seleccionPJ1 == 0)
{
	pj1 = 0;
}
else if (seleccionPJ1 == 1)
{
	pj1 = 1;
}
else if (seleccionPJ1 == 2)
{
	pj1 = 2;
}

else if (seleccionPJ1 == 3)
{
	pj1 = 3;
}

if (seleccionPJ2 == 0)
{
	pj2 = 0;
}
else if (seleccionPJ2 == 1)
{
	pj2 = 1;
}
else if (seleccionPJ2 == 2)
{
	pj2 = 2;
}

else if (seleccionPJ2 == 3)
{
	pj2 = 3;
}

if(seleccionPJ1 > 3)
	{seleccionPJ1 = 0;}

if(seleccionPJ1 < 0)
	{seleccionPJ1 = 3;}

if(seleccionPJ2 > 3)
	{seleccionPJ2 = 0;}

if(seleccionPJ2 < 0)
	{seleccionPJ2 = 3;}
	
myimage_index = (myimage_index + myimage_speed / (game_get_speed(gamespeed_fps) / sprite_get_speed(spr_Pj1_Select))) % sprite_get_number(spr_Pj1_Select);
myimage_index2 = (myimage_index2 + myimage_speed2 / (game_get_speed(gamespeed_fps) / sprite_get_speed(spr_Weiss_Idle))) % sprite_get_number(spr_Weiss_Idle);
myimage_index3 = (myimage_index3 + myimage_speed3 / (game_get_speed(gamespeed_fps) / sprite_get_speed(spr_Goku_Idle))) % sprite_get_number(spr_Goku_Idle);
myimage_index4 = (myimage_index4 + myimage_speed4 / (game_get_speed(gamespeed_fps) / sprite_get_speed(spr_Mario_Menu))) % sprite_get_number(spr_Mario_Menu);
myimage_index5 = (myimage_index5 + myimage_speed5 / (game_get_speed(gamespeed_fps) / sprite_get_speed(spr_Knight_Idle))) % sprite_get_number(spr_Knight_Idle);