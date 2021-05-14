if (timer > 0) 
{
	timer--;
}

if (timer <= 0)
{
	room_goto(MainMenu);
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