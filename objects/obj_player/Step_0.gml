var _x_direction = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _jump = keyboard_check_pressed(vk_space);
var _dash = keyboard_check_pressed(vk_shift);
var _ground = place_meeting(x, y + 1, obj_wall);
var _on_wall = place_meeting(x - 5, y, obj_wall) - place_meeting(x + 5, y, obj_wall);

lock_movement = max(lock_movement - 1, 0);
player_dash.duration = max(player_dash.duration - 1, 0);

if (player_dash.duration > 0) { _y_speed = 0; }
else if (_on_wall != 0) { _y_speed = min(_y_speed + 1, 5); } 
else { _y_speed++; }

if (_dash && player_dash.unlock && player_dash.avaiable) {
	player_dash.avaiable = false;
	player_dash.duration = 10;
	_x_speed = image_xscale * player_dash.dash_speed;
}

if (lock_movement <= 0 && player_dash.duration <= 0) {
	if (_x_direction != 0) image_xscale = _x_direction;
	_x_speed = _x_direction * _speed;

	if (_jump) {
	
		if (_ground) _y_speed = -15;
	
		if (_on_wall != 0 && !_ground) {
			_y_speed = -15;
			_x_speed = _on_wall * _speed;
			lock_movement = 10;
		}
	}
}

if (player_dash.duration > 0) {
	sprite_index = spr_player_dash;
	
} else if (_ground) {
	player_dash.avaiable = true;
	
	if (_x_direction != 0) {
		sprite_index = spr_player_run_strip;
	} else {
		sprite_index = spr_player_idle_strip;
	}
	
} else if (_on_wall != 0) {
	image_xscale = _on_wall;
	sprite_index = spr_player_slide
	
} else {
	sprite_index = spr_player_jump
}

if (place_meeting(x + _x_speed, y, obj_wall)) {
	
	while (!place_meeting(x + sign(_x_speed), y, obj_wall)) {
		x += sign(_x_speed);
	}
	_x_speed = 0;
}

x += _x_speed;


if (place_meeting(x, y + _y_speed, obj_wall)) {
	
	while (!place_meeting(x, y + sign(_y_speed), obj_wall)) {
		y += sign(_y_speed);
	}
	
	_y_speed = 0;
}


y += _y_speed;