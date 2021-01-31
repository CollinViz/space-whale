extends Control

export var ItemText :="Item 1" 
export (Texture) var iconTexture:Texture = load("res://assests/icon/quest_objective_finished.png")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Item.texture = iconTexture
	$ItemName.text = ItemText
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
