audio_play_sound(snd_FallMap,2,false);
if(other.x > room_width)
{
	var explosion = instance_create_depth(room_width,other.y,other.depth,obj_Explosion);
	explosion.sprite_index = spr_Expl1;
	explosion.image_angle = other.direction + 180;
}
else if(other.x < 0)
{
	var explosion = instance_create_depth(0,other.y,other.depth,obj_Explosion);
	explosion.sprite_index = spr_Expl1;
	explosion.image_angle = other.direction + 180;
}
else if(other.y > room_height)
{
	var explosion = instance_create_depth(other.x,room_height,other.depth,obj_Explosion);
	explosion.sprite_index = spr_Expl1;
	explosion.image_angle = other.direction + 180;
}
else if(other.y  < 200)
{
	var explosion = instance_create_depth(other.x,0,other.depth,obj_Explosion);
	explosion.sprite_index = spr_Expl1;
	explosion.image_angle = other.direction + 180;	
}
instance_destroy(other);
if(modoJuego==0)
{
	HPPlayer1 --;
	DamagePlayer1 = 0;
}
else if (modoJuego==1)
{
	HPPlayer1 --;
	HPPlayer2 ++;
	DamagePlayer1 = 0;
}
alarm [1] = 150;
