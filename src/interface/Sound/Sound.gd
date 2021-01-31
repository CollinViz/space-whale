extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var sd_murr_murr = preload("res://Sound/DialogSound/murr_murr.ogg") 
var Random = preload("res://Sound/DialogSound/Random.ogg") 
var Random_faster = preload("res://Sound/DialogSound/Random_faster.ogg") 
var Murr_Murr_formant = preload("res://Sound/DialogSound/Murr_Murr_formant.ogg") 
var murr_murr_higher = preload("res://Sound/DialogSound/murr_murr_higher.ogg") 
var Murr_murr_lower_strange = preload("res://Sound/DialogSound/Murr_murr_lower_strange.ogg") 
var murr_murr_strange_faster = preload("res://Sound/DialogSound/murr_murr_strange_faster.ogg") 
var murr_murr_strange = preload("res://Sound/DialogSound/murr_murr_strange.ogg") 


var DialogSoundArray = Array()
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	DialogSoundArray.append(sd_murr_murr)
	DialogSoundArray.append(Random)
	DialogSoundArray.append(Random_faster)
	DialogSoundArray.append(Murr_Murr_formant)
	DialogSoundArray.append(murr_murr_higher)
	DialogSoundArray.append(Murr_murr_lower_strange)
	DialogSoundArray.append(murr_murr_strange_faster)
	DialogSoundArray.append(murr_murr_strange)
	if !SoundController.play_background:
		background_off()
	else:
		background_on()
	if !SoundController.play_sound:
		sound_off()
	else:
		sound_on()
# warning-ignore:return_value_discarded
	SoundController.connect("background_off",self,"background_off")
# warning-ignore:return_value_discarded
	SoundController.connect("background_on",self,"background_on")
# warning-ignore:return_value_discarded	
	SoundController.connect("sound_on",self,"sound_on")
# warning-ignore:return_value_discarded	
	SoundController.connect("sound_off",self,"sound_off")

# warning-ignore:return_value_discarded
	SoundController.connect("play_Dialog",self,"play_Dialog")
# warning-ignore:return_value_discarded
	SoundController.connect("stop_Dialog",self,"stop_Dialog")
# warning-ignore:return_value_discarded	
	SoundController.connect("enemy_steal",self,"enemy_steal")
# warning-ignore:return_value_discarded
	SoundController.connect("player_pickup",self,"player_pickup")
# warning-ignore:return_value_discarded	
	SoundController.connect("printer_page",self,"printer_page")
# warning-ignore:return_value_discarded	
	SoundController.connect("printer_put",self,"printer_put")

func background_off():	
	$world.stop()
	pass

func background_on():
	$world.play()
	pass

func sound_on():	
	pass

func sound_off():
	$Dialog.stop()
	# $Enemy.stop()
	# $Printer.stop()
 

func play_Dialog():
	

	var indx = randi() % DialogSoundArray.size()-1
	$Dialog.stream = DialogSoundArray[indx]
	$Dialog.play()

func stop_Dialog():	 
	$Dialog.stop()
	 

# func enemy_steal():
# 	pass

# func player_pickup():
# 	$Player.stream = sd_player_pickup
# 	$Player.play()
# 	pass

# func printer_page():
# 	$Printer.stream = sd_printer_page
# 	$Printer.play()
# 	pass

# func printer_put():
# 	$Printer.stream = sd_printer_put
# 	$Printer.play()
# 	pass

