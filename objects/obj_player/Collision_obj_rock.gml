/// @description Insert description here
// You can write your code in this editor

if (powerup == 2) exit;

effect_create_above(ef_firework, x, y, 1, c_white);
audio_play_sound(snd_thwarp,1.0,false);
instance_destroy();
obj_game.alarm[0] = 120;