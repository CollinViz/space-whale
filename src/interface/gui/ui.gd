extends Control

onready var Food = $Panel/Food
onready var Gold = $Panel/Gold
onready var Parts = $Panel/Parts
onready var Water = $Panel/Water

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	update_stock()
	var _x = PlayerData.connect("updated",self,"update_stock")
	pass # Replace with function body.


func update_stock():
	Food.ResourceCount = PlayerData.get_Inventory("Food")
	Gold.ResourceCount = PlayerData.get_Inventory("Gold")
	Parts.ResourceCount = PlayerData.get_Inventory("Parts")
	Water.ResourceCount = PlayerData.get_Inventory("Water") 

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
