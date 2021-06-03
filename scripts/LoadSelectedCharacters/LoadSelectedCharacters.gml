// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function LoadSelectedCharacters(){
	
	//var gameManagerInstance = instance_find(obj_GameManager, 0);
	var player1;
	var player2;
	
	switch(pj1){
		
		case 0: 
			player1 = obj_Goku_player;
			break;
		
		case 1:
			player1 = obj_Weiss_Player;
			break;
		
		case 2:
			player1 = objMarioPlayer;
			break;
			
		case 3:
			player1 = obj_KnightPlayer;
			break;
	}
	switch(pj2){
		
		case 0: 
			player2 = obj_Goku_player;
			break;
		
		case 1:
			player2 = obj_Weiss_Player2;
			break;
		
		case 2:
			player2 = objMarioPlayer2;
			break;
			
		case 3:
			player2 = obj_KnightPlayer2;
			break;
	}
	
	var pj1SpawnPositionX = room_width / 3;
	var ySpawnPosition = room_height / 2;
	var pj2SpawnPositionX = room_width * 2/3;
	
	instance_create_depth(pj1SpawnPositionX, ySpawnPosition, depth, player1);
	instance_create_depth(pj2SpawnPositionX, ySpawnPosition, depth, player2);
}