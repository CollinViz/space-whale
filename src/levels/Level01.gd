extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

 
onready var player := $Player
onready var Dialogfrm :=$Gui/Dialogfrm
onready var Camera :=$Camera

# Called when the node enters the scene tree for the first time.
func _ready():
	$Camera.position = $Player.position 
	PlayerData.reset()
	
# func _unhandled_input(event: InputEvent) -> void:
# 	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
# 		player.target.position = Vector3(get_global_mouse_position().x, get_global_mouse_position().y, 0)
		 

func showDialog(planetWant:Dictionary):
	##Dialogfrm.position = Camera.position
	#Dialogfrm.visible = true
	#yield(Dialogfrm, "ready")
	Dialogfrm.start(planetWant)
	yield(Dialogfrm, "dialogue_ended")
	 
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
