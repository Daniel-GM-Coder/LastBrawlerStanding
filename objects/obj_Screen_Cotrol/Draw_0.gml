draw_sprite(spr_Hud_Ink1,1,-110,-100);
draw_sprite(spr_Hud_Ink2,1,2030,-100);
if (modoJuego==1)
{
	draw_sprite(spr_Hud_Ink3,1,785,-20);
}

draw_set_halign(fa_center);
if (pj1 == 0)
{
	NamePlayer1 = "GOKU";
}
else if (pj1 == 1)
{
	NamePlayer1 = "WEISS";
}
else if (pj1 == 2)
{
	NamePlayer1 = "MARIO";
}

else if (pj1 == 3)
{
	NamePlayer1 = "KNIGHT";
}

imp_text(277,218,NamePlayer1,c_white,font_HUD,1,0.6);

if (pj2 == 0)
{
	NamePlayer2 = "GOKU";
}
else if (pj2 == 1)
{
	NamePlayer2 = "WEISS";
}
else if (pj2 == 2)
{
	NamePlayer2 = "MARIO";
}

else if (pj2 == 3)
{
	NamePlayer2 = "KNIGHT";
}

imp_text(1648,218,NamePlayer2,c_white,font_HUD,1,0.6);
draw_set_halign(fa_left);


if (pj1 == 0)
{
	FacePlayer1 = spr_GokuFace;
}
else if (pj1 == 1)
{
	FacePlayer1 = spr_WeissFace;
}
else if (pj1 == 2)
{
	FacePlayer1 = spr_MarioFace;
}

else if (pj1 == 3)
{
	FacePlayer1 = spr_KnightFace;
}

draw_sprite(FacePlayer1,1,277,74);

if (pj2 == 0)
{
	FacePlayer2 = spr_GokuFace;
}
else if (pj2 == 1)
{
	FacePlayer2 = spr_WeissFace;
}
else if (pj2 == 2)
{
	FacePlayer2 = spr_MarioFace;
}

else if (pj2 == 3)
{
	FacePlayer2 = spr_KnightFace;
}

draw_sprite_ext(FacePlayer2,1,1643,74,-1,1,0,c_white,1);

if (modoJuego==1)
{
	imp_text(880,105,(floor(timer/room_speed/60)),c_white,font_HUD,1,1);
	imp_text(932,105,":",c_white,font_HUD,1,1);
	if(((timer/room_speed) mod 60)<10)
	{
		draw_text(960,105,"0");
		draw_text(1002,105,floor(((timer/room_speed) mod 60)));
	}
	else
	{
		draw_text(960,105,floor(((timer/room_speed) mod 60)));
	}
}

if(DamagePlayer2 < 10)
{
imp_text(370,66,DamagePlayer2,c_white,font_HUD,1,1.6);
imp_text(434,66,"%",c_white,font_HUD,1,1.6);
}
else if((DamagePlayer2 >= 10) && (DamagePlayer2 < 40))
{
	imp_text(370,66,DamagePlayer2,c_white,font_HUD,1,1.6);
	imp_text(509,66,"%",c_white,font_HUD,1,1.6);
}
else if((DamagePlayer2 >= 40) && (DamagePlayer2 < 70))
{
	imp_text(370,66,DamagePlayer2,c_yellow,font_HUD,1,1.6);
	imp_text(509,66,"%",c_yellow,font_HUD,1,1.6);
}
else if((DamagePlayer2 >= 70) && (DamagePlayer2 < 100))
{
	imp_text(370,66,DamagePlayer2,c_orange,font_HUD,1,1.6);
	imp_text(509,66,"%",c_orange,font_HUD,1,1.6);
}
else
{
	imp_text(370,66,DamagePlayer2,c_red,font_HUD,1,1.6);
	imp_text(554,66,"%",c_red,font_HUD,1,1.6);
}

if(DamagePlayer1 < 10)
{
imp_text(1385,66,DamagePlayer1,c_white,font_HUD,1,1.6);
imp_text(1448,66,"%",c_white,font_HUD,1,1.6);
}
else if((DamagePlayer1 >= 10) && (DamagePlayer1 < 40))
{
	imp_text(1306,66,DamagePlayer1,c_white,font_HUD,1,1.6);
	imp_text(1448,66,"%",c_white,font_HUD,1,1.6);
}
else if((DamagePlayer1 >= 40) && (DamagePlayer1 < 70))
{
	imp_text(1306,66,DamagePlayer1,c_yellow,font_HUD,1,1.6);
	imp_text(1448,66,"%",c_yellow,font_HUD,1,1.6);
}
else if((DamagePlayer1 >= 70) && (DamagePlayer1 < 100))
{
	imp_text(1306,66,DamagePlayer1,c_orange,font_HUD,1,1.6);
	imp_text(1448,66,"%",c_orange,font_HUD,1,1.6);
}
else
{
	imp_text(1262,66,DamagePlayer1,c_red,font_HUD,1,1.6);
	imp_text(1448,66,"%",c_red,font_HUD,1,1.6);
}


if (modoJuego==0)
{
	if (pj1 == 0)
	{
		HeadPlayer1 = spr_Goku_Head;
	}
	else if (pj1 == 1)
	{
		HeadPlayer1 = spr_Weiss_Head;
	}
	else if (pj1 == 2)
	{
		HeadPlayer1 = spr_Mario_Head;
	}

	else if (pj1 == 3)
	{
		HeadPlayer1 = spr_Knight_Head;
	}

	draw_sprite(HeadPlayer1,1,420,200);
		if(HPPlayer2>0)
	{
		imp_text(495,200,HPPlayer2,c_white,font_HUD,1,0.6);
	}
	else
	{
		imp_text(495,200,"0",c_white,font_HUD,1,0.6);
	}
	imp_text(475,200,"x",c_white,font_HUD,1,0.5);

	if (pj2 == 0)
	{
		HeadPlayer2 = spr_Goku_Head;
	}
	else if (pj2 == 1)
	{
		HeadPlayer2 = spr_Weiss_Head;
	}
	else if (pj2 == 2)
	{
		HeadPlayer2 = spr_Mario_Head;
	}

	else if (pj2 == 3)
	{
		HeadPlayer2 = spr_Knight_Head;
	}

	draw_sprite(HeadPlayer2,1,1428,200);
	if(HPPlayer1>0)
	{
		imp_text(1498,200,HPPlayer1,c_white,font_HUD,1,0.6);
	}
	else
	{
		imp_text(1498,200,"0",c_white,font_HUD,1,0.6);
	}
	imp_text(1478,200,"x",c_white,font_HUD,1,0.5);
}


if (modoJuego==1 && Ganador > 0 && firstTime2 == 1)
{
	firstTime2 = 0;
	alarm[1] = 50;	
}

if (modoJuego==0 && Ganador > 0 && firstTime2 == 1)
{
	firstTime2 = 0;
	alarm[1] = 50;	
}

if (modoJuego==0 && Ganador > 0)
{
	draw_set_halign(fa_center);
	imp_text(960,300,"SE ACABO",c_yellow,font_MainMenu,1,2);
	draw_set_halign(fa_left);
}

if (modoJuego==1 && Ganador > 0)
{
	draw_set_halign(fa_center);
	imp_text(960,300,"TIEMPO",c_yellow,font_MainMenu,1,2);
	draw_set_halign(fa_left);
}