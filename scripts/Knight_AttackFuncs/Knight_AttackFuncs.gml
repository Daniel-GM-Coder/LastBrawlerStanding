//Entrar en el estado
function KnightEnterAttack(animSpriteIndex, hitMaskIndex)
{
	//Parar al personaje
	if(!onAir)
	{
		speedX = 0;
		speedY = 0;
	}
	if(animSpriteIndex != sprite_index) {
		sprite_index = animSpriteIndex;
		image_index = 0;
	}
	
	if(sprite_index == spr_Knight_NeutralSpecial) {
		if(onAir) {
			speedX = 0;
			speedY = 0;
		}
		if(image_xscale == 1){
			if(image_index == 0) {
				var vfxProy = instance_create_depth(x,y + (sprite_height / 2 ) ,depth, obj_Knight_NVFX);
				vfxProy.image_xscale = 1;
				speedX = 0;
				speedY = 0;
				grav = 0;
			}
			
			if(image_index == 3) {	
				var proy = instance_create_depth(x + (sprite_width),y - (sprite_height / 4 ),depth, obj_Knight_Proyectile);
				proy.hspeed = 10;
				proy.image_xscale = 1;
			}
			if(image_index == image_number - 2 )
				grav = 1;
		
		}else {
			if(image_index == 0) {
				var vfxProy = instance_create_depth(x,y + (sprite_height / 2 ) ,depth, obj_Knight_NVFX);
				vfxProy.image_xscale = -1;
				speedX = 0;
				speedY = 0;
				grav = 0;
			}
			
			if(image_index == 3) {
				var proy = instance_create_depth(x + (sprite_width),y - (sprite_height / 4 ),depth, obj_Knight_Proyectile);
				proy.hspeed = -10;
				proy.image_xscale = -1;
			}
			if(image_index == image_number - 2 )
				grav = 1;
		}
			
	}
	
	if(sprite_index == spr_Knight_Taunt) {
		if(image_index == 0)
			instance_create_depth(x ,y,depth, obj_Knight_Bench);
	}
	
	if(sprite_index == spr_Knight_FSpecial) {
		if(image_index == 0) {
			grav = 0;
			speedY = 0;
		}
		if(image_xscale == 1){
			
			if(image_index > 3 && image_index <8) {
				speedX = 15;
			}
			if(image_index == 8) {
				speedX = 0;
			}
			
		}else {
			if(image_index > 3 && image_index <8) {
				speedX = -15;
			}
			if(image_index == 8) {
				speedX = 0;
			}
		}
		if(image_index == image_number - 2)
				grav = 1;
	}


	if (sprite_index == spr_Knight_UpSpecial) {
		
		if(image_index < 8) {
			speedY = 0;		
			speedX = 0;		
			grav = 0;
		}
		if(image_index >= 8 && image_index < 9) {
			speedY = -25;	
			grav = 1;
		}		
	}
	
	if(sprite_index == spr_Knight_NeutralAir) {
		if(image_index == 0) {
			speedY = 0;		
			speedX = 0;		
			grav = 0;
		}
		if(onAir) {
			speedX = 0;
			speedY = 0;
		}
		if(image_index > 7) {	
			grav = 1;
		}	
	}
	
	if (sprite_index == spr_Knight_DownSpecial) {
		if(image_index < 7) {
			speedY = -10;	
			grav = 0;
		}
		if(image_index >= 8 && image_index < 19) {
			speedY = 20;	
			grav = 1;
		}
		
		if(image_index == 19 && onAir) {
			image_index = 15;
		}
		if(!onAir && image_index > 13 && image_index <19 )
			image_index = 19;
	}

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

}
	//Crear la hitMask
	//var hitMaskInstance = instance_create_depth(x, y, depth + 1, hitMaskIndex);
	//hitMaskInstance.image_xscale = image_xscale;
	//hitMaskInstance.owner = self;


//Comprueba si queremos cambiar de estado
function KnightNextAttack(returnToState)
{	
	//if(sprite_index == spr_Weiss_BasicSpecial && !CastingFinished)
	//{
	//	if(image_index >= image_number - 1)
	//	{
	//		CastingFinished = true;
	//		return 19;
	//	}
	//}
		
	if(sprite_index == spr_Knight_FrontAir && !onAir) {
		speedX = 0;
	}
	
	if(sprite_index == spr_Knight_UpSpecial && image_index >= image_number - 1)
		return 17;
	else if(sprite_index == spr_Knight_NeutralAir && image_index >= image_number - 1)
		return 9;
	else if(sprite_index == spr_Knight_FSpecial && (image_index >= image_number - 1 || image_index >= image_number - 2) && inputNormalSide && !onAir)
		return 3;
	else if(sprite_index == spr_Knight_FSpecial && (image_index >= image_number - 1 || image_index >= image_number - 2) && inputNormalSide && onAir)
		return 12;
	else if(sprite_index == spr_Knight_FSpecial && image_index >= image_number - 1 && onAir)
		return 9;
	else if(image_index >= image_number - 1)
	{
		return returnToState;
	}
	else
		return state;
}