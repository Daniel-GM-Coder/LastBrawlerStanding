if (seleccionMapa == 0)
{
	draw_sprite(spr_Map_Select,myimage_index,576,864);
	draw_set_halign(fa_center);
	imp_text(960,62,"Coliseo Concordia",c_white,font_MainMenu,1,0.8);
	draw_set_halign(fa_left);
	draw_sprite_ext(spr_Map1,image_index,512,160,0.874,0.777,0,c_white,1);

}
else if (seleccionMapa == 1)
{
	draw_sprite(spr_Map_Select,myimage_index,832,864);
	draw_set_halign(fa_center);
	imp_text(960,62,"Ciudad de Lagrimas",c_white,font_MainMenu,1,0.8);
	draw_set_halign(fa_left);
	draw_sprite_ext(spr_Map2,image_index,512,160,0.874,0.777,0,c_white,1);
}
else if (seleccionMapa == 2)
{
	draw_sprite(spr_Map_Select,myimage_index,1088,864);
	draw_set_halign(fa_center);
	imp_text(960,62,"Castillo de Peach",c_white,font_MainMenu,1,0.8);
	draw_set_halign(fa_left);
	draw_sprite_ext(spr_Map3,image_index,512,160,0.874,0.777,0,c_white,1);
}
else if (seleccionMapa == 3)
{
	draw_sprite(spr_Map_Select,myimage_index,1344,864);
	draw_set_halign(fa_center);
	imp_text(960,62,"Arena del Torneo",c_white,font_MainMenu,1,0.8);
	draw_set_halign(fa_left);
	draw_sprite_ext(spr_Map4,image_index,512,160,0.874,0.777,0,c_white,1);
}
