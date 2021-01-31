extends Node2D

onready var img1 = preload("res://assests/end/0001.png")
onready var img2 = preload("res://assests/end/0002.png")
onready var Dialogfrm :=$CanvasLayer/Control/Panel/Dialogfrm
onready var imgChange :=$TextureRect
var indx= 0
# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogfrm.start(Global.Event2Dialog("....","out1"))
	yield(Dialogfrm, "dialogue_ended")
	imgChange.texture = img2
	indx+=1 
	$Timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	if indx==1:
		Dialogfrm.start(Global.Event2Dialog("....","out2"))
		yield(Dialogfrm, "dialogue_ended")
		 
