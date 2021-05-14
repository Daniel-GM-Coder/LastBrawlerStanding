if (fijadoPJ1 == true)
{
	if (keyboard_check_released(ord("Z")))
	{
		audio_play_sound(MainMenuBack,2,false);
		fijadoPJ1 = false;
	}
}
else
{
	if keyboard_check_released(vk_down)
	{
		audio_play_sound(MainMenuChange,2,false);
		seleccionPJ1 ++;
	}

	if keyboard_check_released(vk_up)
	{
		audio_play_sound(MainMenuChange,2,false);
		seleccionPJ1 --;
	}
	
	if (keyboard_check(ord("X")))
	{
		audio_play_sound(MainMenuAccept,2,false);
		fijadoPJ1 = true;
	}
}


if (fijadoPJ2 == true)
{
	if (keyboard_check_released(ord("V")))
	{
		audio_play_sound(MainMenuBack,2,false);
		fijadoPJ2 = false;
	}
}
else
{
	if keyboard_check_released(ord("G"))
	{
		audio_play_sound(MainMenuChange,2,false);
		seleccionPJ2 ++;
	}

	if keyboard_check_released(ord("T"))
	{
		audio_play_sound(MainMenuChange,2,false);
		seleccionPJ2 --;
	}
	if (keyboard_check(ord("B")))
	{
		audio_play_sound(MainMenuAccept,2,false);
		fijadoPJ2 = true;
	}
}

if ((fijadoPJ1 == false) && (fijadoPJ2 == false))
{
	if (keyboard_check(ord("Z")))
	{
		room_goto(MainMenu);
	}
}
if ((fijadoPJ1 == true) && (fijadoPJ2 == true) && (firstTime == true))
{
	alarm [0] = room_speed*2;
	firstTime = false;
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