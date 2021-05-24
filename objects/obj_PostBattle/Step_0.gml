if keyboard_check_released(vk_up)
{
	audio_play_sound(MainMenuChange,2,false);
	PostBattleOpt --;
}

else if keyboard_check_released(vk_down)
{
	audio_play_sound(MainMenuChange,2,false);
	PostBattleOpt ++;
}


if(PostBattleOpt > 3)
	{PostBattleOpt = 0;}

if(PostBattleOpt < 0)
	{PostBattleOpt = 3;}

if (PostBattleOpt==0)
{
	Color0=c_yellow;
	Tamano0=1.1;
	Color1=c_white;
	Tamano1=1;
	Color2=c_white;
	Tamano2=1;
	Color3=c_white;
	Tamano3=1;

}

else if (PostBattleOpt==1)
{
	Color1=c_yellow;
	Tamano1=1.1;
	Color2=c_white;
	Tamano2=1;
	Color0=c_white;
	Tamano0=1;
	Color3=c_white;
	Tamano3=1;
}

else if (PostBattleOpt==2)
{
	Color2=c_yellow;
	Tamano2=1.1;
	Color1=c_white;
	Tamano1=1;
	Color0=c_white;
	Tamano0=1;
	Color3=c_white;
	Tamano3=1;
}

else if (PostBattleOpt==3)
{
	Color3=c_yellow;
	Tamano3=1.1;
	Color1=c_white;
	Tamano1=1;
	Color0=c_white;
	Tamano0=1;
	Color2=c_white;
	Tamano2=1;
}

if keyboard_check_released(ord("X"))
{
	if(PostBattleOpt==0)
	{
		audio_play_sound(MainMenuAccept,2,false);
		if (MapSelected == 0)
		{
			room_goto(Mapa1);
		}
		else if (MapSelected == 1)
		{
			room_goto(Mapa2);
		}
		else if (MapSelected == 2)
		{
			room_goto(Mapa3);
		}
		else if (MapSelected == 3)
		{
			room_goto(Mapa4);
		}
	}
	else if (PostBattleOpt==1)
	{
		audio_play_sound(MainMenuAccept,2,false);
		room_goto(CharacterSelect);
	}
	else if (PostBattleOpt ==2)
	{
		audio_play_sound(MainMenuAccept,2,false);
		room_goto(MapSelect);
	}
	else if (PostBattleOpt ==3)
	{
		audio_play_sound(MainMenuAccept,2,false);
		room_goto(MainMenu);
	}
}

myimage_index2 = (myimage_index2 + myimage_speed2 / (game_get_speed(gamespeed_fps) / sprite_get_speed(spr_Weiss_Walk))) % sprite_get_number(spr_Weiss_Walk);
myimage_index3 = (myimage_index3 + myimage_speed3 / (game_get_speed(gamespeed_fps) / sprite_get_speed(spr_Goku_Walk))) % sprite_get_number(spr_Goku_Walk);
myimage_index4 = (myimage_index4 + myimage_speed4 / (game_get_speed(gamespeed_fps) / sprite_get_speed(sprMarioWalk))) % sprite_get_number(sprMarioWalk);
myimage_index5 = (myimage_index5 + myimage_speed5 / (game_get_speed(gamespeed_fps) / sprite_get_speed(spr_Knight_Walk))) % sprite_get_number(spr_Knight_Walk);