if keyboard_check_released(vk_right)
{
	audio_play_sound(MainMenuChange,2,false);
	mainmenu ++;
}

else if keyboard_check_released(vk_left)
{
	audio_play_sound(MainMenuChange,2,false);
	mainmenu --;
}


if(mainmenu > 2)
	{mainmenu = 0;}

if(mainmenu < 0)
	{mainmenu = 2;}

if (mainmenu==0)
{
	Color0=c_green;
	Tamano0=1.1;
	Color1=c_white;
	Tamano1=1;
	Color2=c_white;
	Tamano2=1;
}

else if (mainmenu==1)
{
	Color1=c_yellow;
	Tamano1=1.1;
	Color2=c_white;
	Tamano2=1;
	Color0=c_white;
	Tamano0=1;
}

else if (mainmenu==2)
{
	Color2=c_red;
	Tamano2=1.1;
	Color1=c_white;
	Tamano1=1;
	Color0=c_white;
	Tamano0=1;
}


if keyboard_check_released(vk_space)
{
	if(mainmenu==0 || mainmenu==1)
	{
		audio_play_sound(MainMenuAccept,2,false);
		audio_stop_sound(MainMenuBM)
		room_goto(CharacterSelect);
	}
else if (mainmenu ==2)
{
	audio_play_sound(MainMenuBack,2,false)
	alarm[0]=50;
	}
}

