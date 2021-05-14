if (seleccionPJ1 == 0)
{
	if (fijadoPJ1 == true)
	{
		draw_sprite(spr_Pj1_Select,image_index,256,288);
	}
	else
	{
		draw_sprite(spr_Pj1_Select,myimage_index,256,288);
	}
	draw_sprite_ext(spr_Goku_Idle,myimage_index3,656,793.8,3.133,3.773,0,c_white,1);
	draw_set_halign(fa_center);
	imp_text(672,925,"GOKU",c_white,font_MainMenu,1,0.8);
	draw_set_halign(fa_left);

}
else if (seleccionPJ1 == 1)
{
	if (fijadoPJ1 == true)
	{
		draw_sprite(spr_Pj1_Select,image_index,160,448);
	}
	else
	{
		draw_sprite(spr_Pj1_Select,myimage_index,160,448);
	}
	draw_sprite_ext(spr_Weiss_Idle,myimage_index2,672,832,3.24,3.707,0,c_white,1);
	draw_set_halign(fa_center);
	imp_text(672,925,"WEISS",c_white,font_MainMenu,1,0.8);
	draw_set_halign(fa_left);

}
else if (seleccionPJ1 == 2)
{
	if (fijadoPJ1 == true)
	{
		draw_sprite(spr_Pj1_Select,image_index,160,608);
	}
	else
	{
		draw_sprite(spr_Pj1_Select,myimage_index,160,608);
	}
	draw_sprite_ext(spr_Mario_Menu,myimage_index4,544,448,3.909,5.571,0,c_white,1);
	draw_set_halign(fa_center);
	imp_text(672,925,"MARIO",c_white,font_MainMenu,1,0.8);
	draw_set_halign(fa_left);

}
else if (seleccionPJ1 == 3)
{
	if (fijadoPJ1 == true)
	{
		draw_sprite(spr_Pj1_Select,image_index,256,768);
	}
	else
	{
		draw_sprite(spr_Pj1_Select,myimage_index,256,768);
	}
	draw_sprite_ext(spr_Knight_Idle,myimage_index5,544,512,3.962,4.027,0,c_white,1);
	draw_set_halign(fa_center);
	imp_text(672,925,"HOLLOW",c_white,font_MainMenu,1,0.8);
	draw_set_halign(fa_left);

}


if (seleccionPJ2 == 0)
{
	if (fijadoPJ2 == true)
	{
		draw_sprite(spr_Pj2_Select,image_index,1664,288);
	}
	else
	{
		draw_sprite(spr_Pj2_Select,myimage_index,1664,288);
	}
	draw_sprite_ext(spr_Goku_Idle,myimage_index3,1275,793.8,-3.133,3.773,0,c_white,1);
	draw_set_halign(fa_center);
	imp_text(1250,925,"GOKU",c_white,font_MainMenu,1,0.8);
	draw_set_halign(fa_left);
}
else if (seleccionPJ2 == 1)
{
	if (fijadoPJ2 == true)
	{
		draw_sprite(spr_Pj2_Select,image_index,1760,448);
	}
	else
	{
		draw_sprite(spr_Pj2_Select,myimage_index,1760,448);
	}
	draw_sprite_ext(spr_Weiss_Idle,myimage_index2,1272,832,-3.24,3.707,0,c_white,1);
	draw_set_halign(fa_center);
	imp_text(1250,925,"WEISS",c_white,font_MainMenu,1,0.8);
	draw_set_halign(fa_left);
}
else if (seleccionPJ2 == 2)
{
	if (fijadoPJ2 == true)
	{
		draw_sprite(spr_Pj2_Select,image_index,1760,608);
	}
	else
	{
		draw_sprite(spr_Pj2_Select,myimage_index,1760,608);
	}
	draw_sprite_ext(spr_Mario_Menu,myimage_index4,1374,448,-3.909,5.571,0,c_white,1);
	draw_set_halign(fa_center);
	imp_text(1250,925,"MARIO",c_white,font_MainMenu,1,0.8);
	draw_set_halign(fa_left);
}
else if (seleccionPJ2 == 3)
{
	if (fijadoPJ2 == true)
	{
		draw_sprite(spr_Pj2_Select,image_index,1664,768);
	}
	else
	{
		draw_sprite(spr_Pj2_Select,myimage_index,1664,768);
	}
	draw_sprite_ext(spr_Knight_Idle,myimage_index5,1344,512,-3.962,4.027,0,c_white,1);
	draw_set_halign(fa_center);
	imp_text(1250,925,"HOLLOW",c_white,font_MainMenu,1,0.8);
	draw_set_halign(fa_left);
}

if (fijadoPJ1 == true)
{
	draw_set_halign(fa_center);
	imp_text(670,185,"LISTO",c_red,font_MainMenu,1,1.1);
	draw_set_halign(fa_left);
}

else
{
	draw_set_halign(fa_center);
	imp_text(670,185,"ELIGIENDO",c_white,font_MainMenu,1,1.1);
	draw_set_halign(fa_left);
}

if (fijadoPJ2 == true)
{
	draw_set_halign(fa_center);
	imp_text(1250,185,"LISTO",c_blue,font_MainMenu,1,1.1);
	draw_set_halign(fa_left);
}

else
{
	draw_set_halign(fa_center);
	imp_text(1250,185,"ELIGIENDO",c_white,font_MainMenu,1,1.1);
	draw_set_halign(fa_left);
}

if (modoJuego == 0)
{	
	draw_set_halign(fa_center);
	imp_text(960,40,"POR VIDAS",c_green,font_MainMenu,1,1.6);
	draw_set_halign(fa_left);
}
else
{
	draw_set_halign(fa_center);
	imp_text(960,40,"POR TIEMPO",c_yellow,font_MainMenu,1,1.6);
	draw_set_halign(fa_left);
}