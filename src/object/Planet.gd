extends Node2D
export (Texture) var Skin:Texture = load("res://assests/circle.png")
export (String) var Name:String = "X1234" 
export (Dictionary) var needs:Dictionary = {Gold=0,Food=1,Parts=0,Water=0} 
export (Dictionary) var has:Dictionary = {Gold=1,Food=0,Parts=0,Water=0.5} 
export (Dictionary) var QuestItemsNeeds:Dictionary = {Gold=0,Food=0,Parts=0,Water=10} 
export (String) var QuestItemsHas:String = "broom" 
export (String) var FirstDialog:String ="plantSayHello"
export (String) var QuestDialog:String ="plantSayQuest"
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.texture = Skin
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(_body):
	$quest.visible = true


func _on_quest_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		print("Stuff happend",event)
		var DialogText = FirstDialog
		if !PlayerData.PlayerBeenPlanet(Name): 
			PlayerData.set_PlayerBeenPlanet(Name)
		else:
			if !PlayerData.checkQuest(QuestItemsHas) and QuestItemsHas!="":
				DialogText = QuestDialog

		get_parent().showDialog(Global.Plant2Dialog(Name,needs,has,QuestItemsNeeds,QuestItemsHas,DialogText))


func _on_Area2D_body_exited(_body):
	
	$quest/AnimationPlayer.play("Attention")
	$quest.visible = false
