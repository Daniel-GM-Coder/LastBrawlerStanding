//Entrar en el estado
function WeissEnterAttack(animSpriteIndex, hitMaskIndex)
{
	//Parar al personaje
	if(!onAir)
	{
		speedX = 0;
		speedY = 0;
	}
	
	sprite_index = animSpriteIndex;
	image_index = 0;

	//if(CastingFinished)
	//{
	//		if(facingRight == 0)
	//		{
	//			var WeissProyect = instance_create_depth(x - 70,y - 80,depth,obj_Weiss_Proyectile);
	//			WeissProyect.image_xscale = -1;
	//			WeissProyect.hspeed = -5;
	//			CastingFinished = false;
	//		}
	//		else
	//		{
	//			var WeissProyect = instance_create_depth(x + 70,y - 80,depth,obj_Weiss_Proyectile);
	//			WeissProyect.image_xscale = 1;
	//			WeissProyect.hspeed = 5;
	//			CastingFinished = false;
	//		}
	//}	
	
		if(sprite_index == spr_Weiss_DownSpecial)
			{
				
				if(instance_number(obj_Weiss_Platform) < 1)
				{
					if(facingRight == 0)
					{
						instance_create_depth(x - 350, y - 40,depth,obj_Weiss_Platform);
					}
					else if(facingRight == 1)
					{
						instance_create_depth(x + 350, y - 40,depth,obj_Weiss_Platform);
					}
				}
				else
				{}
			}
		
		if(sprite_index == spr_Weiss_UpSpecial)
		{
			if(facingRight == 0)
				{
					sprite_index = spr_Weiss_UpSpecial;
					image_xscale = -1;
					speedY = -30;
					speedX = -5;
				}
			else if (facingRight == 1)
				{
					sprite_index = spr_Weiss_UpSpecial;
					image_xscale = 1;
					speedY = -30;
					speedX = 5;
				}
		}
		
		if(sprite_index == spr_Weiss_SideSpecial)
		{
			if(image_index == 0) {
				grav = 0;
				speedY = 0;
			}
			if(facingRight == 0)
			{
				sprite_index = spr_Weiss_SideSpecial;
				image_xscale = -1;
				speedX = -10;
			}
			else if (facingRight == 1)
			{
				sprite_index = spr_Weiss_SideSpecial;
				image_xscale = 1;
				speedX = 10;
			}
			if(image_index == image_number - 2) {
				grav = 1;
			}

}

	//Crear la hitMask
	if(hitMaskIndex != noone)
	{
		var hitMaskInstance = instance_create_depth(x, y, depth + 1, hitMaskIndex);
		hitMaskInstance.image_xscale = image_xscale;
		hitMaskInstance.owner = self;
	}
	//var hitMaskInstance = instance_create_depth(x, y, depth + 1, hitMaskIndex);
	//hitMaskInstance.image_xscale = image_xscale;
	//hitMaskInstance.owner = self;


//Comprueba si queremos cambiar de estado
function WeissNextAttack(returnToState)
{	
	//if(sprite_index == spr_Weiss_BasicSpecial && !CastingFinished)
	//{
	//	if(image_index >= image_number - 1)
	//	{
	//		CastingFinished = true;
	//		return 19;
	//	}
	//}
	if(image_index >= image_number - 1)
	{
		if(sprite_index == spr_Weiss_BasicSpecial)
		{
			if(image_xscale == -1)
			{
				var WeissProyect = instance_create_depth(x - 70,y - 80,depth,obj_Weiss_Proyectile);
				WeissProyect.image_xscale = -1;
				WeissProyect.hspeed = -5;
				WeissProyect.owner = self;
				CastingFinished = false;
			}
			else
			{
				var WeissProyect = instance_create_depth(x + 70,y - 80,depth,obj_Weiss_Proyectile);
				WeissProyect.image_xscale = 1;
				WeissProyect.hspeed = 5;
				WeissProyect.owner = self;
				CastingFinished = false;
			}
		}
		return returnToState;
	}
	else
		return state;
	}
}