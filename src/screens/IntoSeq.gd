extends Node2D


export(String, FILE) var starSysPath1: = "res://src/levels/Level01.tscn"

onready var img1 = preload("res://assests/Intro/001.png")
onready var img2 = preload("res://assests/Intro/002.png")
onready var img3 = preload("res://assests/Intro/003.png")
onready var img4 = preload("res://assests/Intro/004.png")
onready var img5 = preload("res://assests/Intro/005.png")
onready var imgChange :=$TextureRect
onready var Dialogfrm :=$CanvasLayer/Control/Panel/Dialogfrm
var indx= 0
# Called when the node enters the scene tree for the first time.
func _ready():
	PlayerData.reset()
	Dialogfrm.start(Global.Event2Dialog("....","intro1"))
	yield(Dialogfrm, "dialogue_ended")
	imgChange.texture = img2
	indx+=1 
	$Timer.start()
	
	
	Dialogfrm.start(Global.Event2Dialog("....","intro5"))
	yield(Dialogfrm, "dialogue_ended")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	if indx==1:
		Dialogfrm.start(Global.Event2Dialog("....","intro2"))
		yield(Dialogfrm, "dialogue_ended")
		imgChange.texture = img3
		indx+=1
		$Timer.start()
	if indx==2:
		Dialogfrm.start(Global.Event2Dialog("....","intro3"))
		yield(Dialogfrm, "dialogue_ended")
		imgChange.texture = img4
		indx+=1
		$Timer.start()
	if indx==3:
		Dialogfrm.start(Global.Event2Dialog("....","intro4"))
		yield(Dialogfrm, "dialogue_ended")
		imgChange.texture = img5
		indx+=1
		$Timer.start()
	if indx==4:
		Dialogfrm.start(Global.Event2Dialog("....","intro5"))
		yield(Dialogfrm, "dialogue_ended")
		indx+=1
		$Timer.start()
	if indx==5:
		get_tree().change_scene(starSysPath1)
