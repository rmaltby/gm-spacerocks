/// @description Insert description here
// You can write your code in this editor

// choose and generate a power up when timer is expired
if (obj_game.powerup_time < 0) {
	var _obj = choose(obj_powerup_spread, obj_powerup_ghost); //, obj_powerup_fireball);
	instance_create_layer(x, y, "Instances", _obj);
	obj_game.powerup_time = 20;
}

// destroy bullet
instance_destroy(other);

// change direction
direction = random(360);

// add points and increase difficulty level
obj_game.points += 50;
obj_game.difficulty += 0.05;


if (sprite_index == spr_rock_big) {
	// if it is a big rock
	// play small thwarp sound
	audio_play_sound(snd_thwarp_smol,1.0,false); 
	// change to a small rock
	sprite_index = spr_rock_small;
	// and duplicate the small rock
	var _copied = instance_copy(true);
} else if instance_number(obj_rock) < 12 {
	// if it is a small rock and there are less than 12 rocks on the board
	// draw explosion
	effect_create_above(ef_explosion, x, y, 1, choose(c_white,c_red,c_blue,c_yellow,c_orange));
	// play the explosion sound
	audio_play_sound(snd_splosion,1.0,false);	
	// change to a big rock
	sprite_index = spr_rock_big;
	// and move it off the board
	x = -100;
} else {
	// it is a small rock and there are 12 or more rocks
	// draw explosion
	effect_create_above(ef_explosion, x, y, 1, choose(c_white,c_red,c_blue,c_yellow,c_orange));
	// play the explosion sound
	audio_play_sound(snd_splosion,1.0,false);	
	// and destroy the instance
	instance_destroy();
}