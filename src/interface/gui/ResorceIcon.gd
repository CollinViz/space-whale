extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var ResourceName:="Water"
export var ResourceIcon := "W"

export var ResourceCount := 0 setget updateQty

# Called when the node enters the scene tree for the first time.
func _ready():
	$Count.text=" 0 " + ResourceName + "Units"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func updateQty(value: int):
	ResourceCount = value
	$Count.text = str(ResourceCount) + " " + ResourceName + " Units"
