if (keyboard_check(ord("A")) && (keyboard_check(vk_right)))
{
	image_xscale=1;
	sprite_index=spr_Weiss_SideAttack;
}
else if (keyboard_check(ord("A")) && (keyboard_check(vk_left)))
{
	image_xscale=-1;
	sprite_index=spr_Weiss_SideAttack;
}
else if (keyboard_check(ord("A")) && (keyboard_check(vk_up)))
{
	sprite_index=spr_Weiss_UpAttack;
}
else if (keyboard_check(ord("A")) && (keyboard_check(vk_down)))
{
	sprite_index=spr_Weiss_DownAttack;
}
else if (keyboard_check(ord("A")))
{
	sprite_index=spr_Weiss_BasicAttack;
}
else if (keyboard_check(vk_right))
{
	x=x+5;
	sprite_index=spr_Weiss_Walk;
	image_xscale=1;
}

else if (keyboard_check(vk_left))
{
	x=x-5;
	sprite_index=spr_Weiss_Walk;
	image_xscale=-1;
}
else
{
	sprite_index = spr_Weiss_Idle;
}

y=y+1;