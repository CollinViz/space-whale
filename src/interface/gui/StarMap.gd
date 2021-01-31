extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(String, FILE) var starSysPath1: = ""
export(String, FILE) var starSysPath2: = ""
export(String, FILE) var starSysPath3: = ""
export(String, FILE) var starSysPath4: = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func showMe():
	show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_StarMap_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		hide()


func _on_StarSys1_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		get_tree().change_scene(starSysPath1)
	pass # Replace with function body.


func _on_StarSys2_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		get_tree().change_scene(starSysPath2)
	pass # Replace with function body.


func _on_StarSys3_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		get_tree().change_scene(starSysPath3)
	pass # Replace with function body.


func _on_StarSys4_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		get_tree().change_scene(starSysPath4)
	pass # Replace with function body.
