firingDelay = firingDelay - 1;
if(keyboard_check_pressed(ord("A")) || keyboard_check_pressed(ord("D"))){
	if(keyboard_check_pressed(ord("D"))){
		if(playerCurrentDirection == 0){
			playerCurrentDirection = 270;
		}else{
			playerCurrentDirection -= 90;
		}
	}else{
		if(playerCurrentDirection == 270){
			playerCurrentDirection = 0;
		}else{
			playerCurrentDirection += 90;
		}
	}
	
	switch(playerCurrentDirection){
	case 0:
		sprite_index = playerSpriteRight;
		break;	
	case 90:
		sprite_index = playerSpriteUp;
		break;
	case 180:
		sprite_index = playerSpriteLeft;
		break;
	case 270:
		sprite_index = playerSpriteDown;
		break;
	}
}

if(keyboard_check_pressed(vk_space) && (firingDelay < 0)){
	firingDelay = 50;
	with(instance_create_layer(x,y,"Bullets",bulletObject)){
		speed = 8;
		direction = playerObject.playerCurrentDirection;
		image_angle = direction;
	}
	
	
	playerDestinationX = playerObject.x;
	playerDestinationY = playerObject.y;
	switch(playerCurrentDirection){
	case 0:
		if(collision_line(playerObject.x,playerObject.y,playerObject.x - moveDistance,playerObject.y,wallObject,false,false) == noone){
			playerDestinationX = playerObject.x - moveDistance;
			break;	
		}else if (collision_line(playerObject.x,playerObject.y,playerObject.x - (moveDistance/2),playerObject.y,wallObject,false,false) == noone){
			playerDestinationX = playerObject.x - (moveDistance/2);
			break;	
		}
		break;
		
	case 90:
		if(collision_line(playerObject.x,playerObject.y,playerObject.x,playerObject.y + moveDistance,wallObject,false,false) == noone){
		playerDestinationY = playerObject.y + moveDistance;
			break;	
		}else if (collision_line(playerObject.x,playerObject.y,playerObject.x,playerObject.y + (moveDistance/2),wallObject,false,false) == noone){
		playerDestinationY = playerObject.y + (moveDistance/2);
			break;	
		}
		break;
		
	case 180:
		if(collision_line(playerObject.x,playerObject.y,playerObject.x + moveDistance,playerObject.y,wallObject,false,false) == noone){
			playerDestinationX = playerObject.x + moveDistance;
			break;	
		}else if (collision_line(playerObject.x,playerObject.y,playerObject.x + (moveDistance/2),playerObject.y,wallObject,false,false) == noone){
			playerDestinationX = playerObject.x + (moveDistance/2);
			break;	
		}
		break;	
		
	case 270:
		if(collision_line(playerObject.x,playerObject.y,playerObject.x,playerObject.y - moveDistance,wallObject,false,false) == noone){
		playerDestinationY = playerObject.y - moveDistance;
			break;	
		}else if (collision_line(playerObject.x,playerObject.y,playerObject.x,playerObject.y - (moveDistance/2),wallObject,false,false) == noone){
		playerDestinationY = playerObject.y - (moveDistance/2);
			break;	
		}
		break;	
	}
	TweenEasyMove(x,y,playerDestinationX,playerDestinationY,0,0.75,EaseInOutQuad);
}
