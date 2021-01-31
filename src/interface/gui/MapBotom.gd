extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TextureRect_mouse_entered():
	pass


func _on_MapBotom_mouse_exited():
	pass


func _on_TextureRect_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		
		get_parent().get_node("StarMap").showMe()
		#show map or hid map
