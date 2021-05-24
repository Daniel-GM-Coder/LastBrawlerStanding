
if (modoJuego==1)
{
	timer = room_speed * 300;
	alarm[0] = 30000;
	globalvar HPPlayer1;
	HPPlayer1 = 0;
	globalvar HPPlayer2;
	HPPlayer2 = 0;
}

else if (modoJuego==0)
{
	globalvar HPPlayer1;
	HPPlayer1 = 5;
	globalvar HPPlayer2;
	HPPlayer2 = 5;
}

globalvar DamagePlayer1;
DamagePlayer1 = 0;
globalvar DamagePlayer2;
DamagePlayer2 = 0;

globalvar Ganador;
Ganador = 0;

firstTime2 = 1;