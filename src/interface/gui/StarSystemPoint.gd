extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal TryFly(NewScene)
signal PlayDialog(DialogScript)

export(String, FILE) var starSysPath1: = ""
export(String) var DialogScript:=""
export(String) var QuestItem:=""
export(bool) var AreYouHere: = false setget hideShowYouAreHear

func _ready():
	hideShowYouAreHear(AreYouHere)

func hideShowYouAreHear(value):
	$Pickups_YOUAREHERE.visible = value
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_StarSys1_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		if !AreYouHere:
			if QuestItem!="" and PlayerData.checkQuest(QuestItem):
				emit_signal("TryFly",starSysPath1)
			else:
				if DialogScript!="":
					emit_signal("PlayDialog",DialogScript)
