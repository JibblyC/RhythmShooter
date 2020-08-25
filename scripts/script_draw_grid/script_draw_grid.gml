function script_draw_grid() {
	var line_width = 1;

	draw_set_color(c_orange);

	for(var i = 0; i < room_height;i +=32){
		draw_line_width(0,i,room_width,i,line_width);
	}

	for(var i = 0; i < room_width;i +=32){
		draw_line_width(i,0,i,room_height,line_width);
	}



}
