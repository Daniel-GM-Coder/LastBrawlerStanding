imp_text(199,205,"VOLVER A JUGAR",c_black,font_MainMenu,0.5,Tamano0);
imp_text(194,200,"VOLVER A JUGAR",Color0,font_MainMenu,1,Tamano0);

imp_text(199,405,"ELEGIR PERSONAJE",c_black,font_MainMenu,0.5,Tamano1);
imp_text(194,400,"ELEGIR PERSONAJE",Color1,font_MainMenu,1,Tamano1);

imp_text(199,605,"ELEGIR ESCENARIO",c_black,font_MainMenu,0.5,Tamano2);
imp_text(194,600,"ELEGIR ESCENARIO",Color2,font_MainMenu,1,Tamano2);

imp_text(199,805,"MENU PRINCIPAL",c_black,font_MainMenu,0.5,Tamano3);
imp_text(194,800,"MENU PRINCIPAL",Color3,font_MainMenu,1,Tamano3);

if(Ganador==1)
{	
	draw_set_halign(fa_center);
	imp_text(1561,35,"GANA JUGADOR 1",c_red,font_MainMenu,1,1);
	draw_set_halign(fa_left);
	if(pj1 == 1)
	{
		draw_sprite_ext(spr_Weiss_Walk,myimage_index2,1566,882.8,-3.422,3.476,0,c_white,1);	
	}
	else if(pj1 == 0)
	{
		draw_sprite_ext(spr_Goku_Walk,myimage_index3,1566,882.8,-3.133,3.773,0,c_white,1);	
	}
	else if(pj1 == 2)
	{
		draw_sprite_ext(sprMarioWalk,myimage_index4,1566,882.8,-3.909,5.571,0,c_white,1);	
	}
	else if(pj1 == 3)
	{
		draw_sprite_ext(spr_Knight_Walk,myimage_index5,1566,882.8,-3.962,4.027,0,c_white,1);	
	}
}
else if(Ganador==2)
{
	draw_set_halign(fa_center);
	imp_text(1561,35,"GANA JUGADOR 2",c_blue,font_MainMenu,1,1);
	draw_set_halign(fa_left);
	if(pj2 == 1)
	{
		draw_sprite_ext(spr_Weiss_Walk,myimage_index2,1566,882.8,-3.422,3.476,0,c_white,1);	
	}
	else if(pj2 == 0)
	{
		draw_sprite_ext(spr_Goku_Walk,myimage_index3,1566,882.8,-3.133,3.773,0,c_white,1);	
	}
	else if(pj2 == 2)
	{
		draw_sprite_ext(sprMarioWalk,myimage_index4,1566,882.8,-3.909,5.571,0,c_white,1);	
	}
	else if(pj2 == 3)
	{
		draw_sprite_ext(spr_Knight_Walk,myimage_index5,1566,882.8,-3.962,4.027,0,c_white,1);	
	}
}
else
{
	draw_set_halign(fa_center);
	imp_text(1561,35,"EMPATE",c_gray,font_MainMenu,1,1);
	draw_set_halign(fa_left);
}