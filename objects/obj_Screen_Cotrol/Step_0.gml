if (modoJuego==1)
{
	if (timer > 0) 
	{
		timer--;
	}

	if (timer <= 0)
	{
		if (HPPlayer1>HPPlayer2 && firstTime2==1)
		{	
			Ganador=2;
			audio_play_sound(snd_WinTime,2,false)
			alarm[1] = 100;
			firstTime2=0;
		}
		else if (HPPlayer2>HPPlayer1 && firstTime2==1)
		{
			Ganador=1;
			audio_play_sound(snd_WinTime,2,false)
			alarm[1] = 100;	
			firstTime2=0;
		}
		else if (HPPlayer2==HPPlayer1 && firstTime2==1)
		{
			Ganador=3;
			audio_play_sound(snd_WinTime,2,false)
			alarm[1] = 100;;	
			firstTime2=0;
		}
	}
}

if (modoJuego==0)
{
	if(HPPlayer2<0 && firstTime2==1)
	{
		audio_play_sound(snd_WinHP,2,false)
		Ganador=2;
		alarm[1] = 100;
		firstTime2=0;
	}
	else if(HPPlayer1<0 && firstTime2==1)
	{
		audio_play_sound(snd_WinHP,2,false)
		Ganador=1;
		alarm[1] = 100;
		firstTime2=0;
	}
}

if (keyboard_check(ord("O")))
{
	DamagePlayer1 = DamagePlayer1 + 1;
	DamagePlayer2 = DamagePlayer2 + 1;
}

if (keyboard_check(ord("L")))
{
	DamagePlayer1 = DamagePlayer1 - 1;
	DamagePlayer2 = DamagePlayer2 - 1;
}

if (keyboard_check(vk_escape))
{
	room_goto(MapSelect);
}	