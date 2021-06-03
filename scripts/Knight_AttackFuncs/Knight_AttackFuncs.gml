//Entrar en el estado
function KnightEnterAttack(animSpriteIndex, hitMaskIndex)
{
	//Parar al personaje
	if(!onAir)
	{
		speedX = 0;
		speedY = 0;
	}
	
	sprite_index = animSpriteIndex;
	/*image_index = 0;*/

	if(sprite_index == spr_Knight_UpSpecial) {

		if(image_index < 8) {
			speedX = 0;
			speedY = 0;
		}
		
		if(image_index == 8) {
			speedY = -10;
		}
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
	if(image_index >= image_number - 1)
	{
		
		return returnToState;
	}
	else
		return state;
}