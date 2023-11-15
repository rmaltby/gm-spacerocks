/// @description Insert description here
// You can write your code in this editor
move_wrap(true,true,0);

if keyboard_check(vk_up) {
	motion_add(image_angle, 0.1);
};
if keyboard_check(vk_right) {
	image_angle -= 4;
};
if keyboard_check(vk_left) {
	image_angle += 4;
};
if keyboard_check(vk_down) {
	motion_add(image_angle, -0.1);
};

if mouse_check_button_pressed(mb_left) | keyboard_check_pressed(vk_space) {
	instance_create_layer(x, y, "Instances", obj_bullet);
	audio_play_sound(snd_pik,1.0,false);
	
	if (powerup == 1) {
		var _bullet = instance_create_layer(x, y, "Instances", obj_bullet);
		_bullet.direction += 10;
		_bullet = instance_create_layer(x, y, "Instances", obj_bullet);
		_bullet.direction -= 10;
	}
};

if keyboard_check(vk_escape) {
	room_goto(rm_menu);
};