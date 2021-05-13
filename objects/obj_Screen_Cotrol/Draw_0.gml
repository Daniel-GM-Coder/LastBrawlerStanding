draw_sprite(spr_Hud_Ink1,1,-110,-100);
draw_sprite(spr_Hud_Ink2,1,2030,-100);
draw_sprite(spr_Hud_Ink3,1,785,-20);
FacePlayer1 = spr_WeissFace;
draw_sprite(FacePlayer1,1,277,74);
FacePlayer2 = spr_GokuFace;
draw_sprite_ext(FacePlayer2,1,1643,74,-1,1,0,c_white,1);

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

if(DamagePlayer1 < 10)
{
imp_text(370,66,DamagePlayer1,c_white,font_HUD,1,1.6);
imp_text(434,66,"%",c_white,font_HUD,1,1.6);
}
else if((DamagePlayer1 >= 10) && (DamagePlayer1 < 100))
{
	imp_text(370,66,DamagePlayer1,c_white,font_HUD,1,1.6);
	imp_text(509,66,"%",c_white,font_HUD,1,1.6);
}
else
{
	imp_text(370,66,DamagePlayer1,c_white,font_HUD,1,1.6);
	imp_text(554,66,"%",c_white,font_HUD,1,1.6);
}

if(DamagePlayer2 < 10)
{
imp_text(1385,66,DamagePlayer2,c_white,font_HUD,1,1.6);
imp_text(1448,66,"%",c_white,font_HUD,1,1.6);
}
else if((DamagePlayer2 >= 10) && (DamagePlayer2 < 100))
{
	imp_text(1306,66,DamagePlayer2,c_white,font_HUD,1,1.6);
	imp_text(1448,66,"%",c_white,font_HUD,1,1.6);
}
else
{
	imp_text(1262,66,DamagePlayer2,c_white,font_HUD,1,1.6);
	imp_text(1448,66,"%",c_white,font_HUD,1,1.6);
}

