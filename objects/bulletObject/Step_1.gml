if (place_meeting(x,y,wallObject) || place_meeting(x,y,enemyObject)){
	speed = 0;
	sprite_index = bulletDestroySprite;
	image_speed = .3;
	if(alarm[0] < 0){
		alarm[0] = room_speed;
	}
}