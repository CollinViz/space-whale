extends Node

signal play_Dialog
signal stop_Dialog
signal enemy_steal
signal player_pickup
signal printer_page
signal printer_put
signal sound_off
signal sound_on
signal background_off
signal background_on

var play_sound = true setget _set_playSound
var play_background = true setget _set_background

func _set_playSound(new_value:bool):
	if !new_value:
		emit_signal("sound_off")
	else:
		emit_signal("sound_on")
	play_sound = new_value

func _set_background(new_value:bool):
	if !new_value:
		emit_signal("background_off")
	else:
		emit_signal("background_on")
	play_background = new_value

func play_Dialog():
	if play_sound:
		emit_signal("play_Dialog")

func stop_Dialog():
	if play_sound:
		emit_signal("stop_Dialog")

func player_pickup():
	if play_sound:
		emit_signal("player_pickup")

func printer_page():
	if play_sound:
		emit_signal("printer_page")

func printer_put():
	if play_sound:
		emit_signal("printer_put")

func enemy_steal():
	if play_sound:
		emit_signal("enemy_steal")
