var _x_camera = clamp(obj_player.x - camera_width / 2, 0, room_width - camera_width);
var _y_camera = clamp(obj_player.y - camera_height / 2, 0, room_height - camera_height);


var _current_x = camera_get_view_x(view_camera[0]);
var _current_y = camera_get_view_y(view_camera[0]);

var _new_x = lerp(_current_x, _x_camera, 0.1);
var _new_y = lerp(_current_y, _y_camera, 0.1);

camera_set_view_pos(view_camera[0], _new_x, _new_y);

layer_x(layer_get_id("Backgrond"), _new_x * 0.65);
layer_y(layer_get_id("Backgrond"), _new_y * 0.65);
