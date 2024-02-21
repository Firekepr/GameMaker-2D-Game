var _x_direction = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _jump = keyboard_check_pressed(vk_space);
var _ground = place_meeting(x, y + 1, obj_wall);

if (_x_direction != 0) image_xscale = _x_direction;

_x_speed = _x_direction * _speed;
_y_speed++;

if (_ground) {
	if (_x_direction != 0) {
		sprite_index = spr_player_run_strip;
	} else {
		sprite_index = spr_player_idle_strip;
	}

	if (_jump) _y_speed = -15;
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