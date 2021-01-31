extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var imgQuest = $CenterContainer/Item
onready var animationP = $CenterContainer/AnimationPlayer
onready var Broom = preload("res://assests/Icons_Whale-Scratcher.png")
onready var Storage = preload("res://assests/Icons_Storage.png")
onready var Map = preload("res://assests/Icons_NavMap.png") 
# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	var _y = PlayerData.connect("QuestItemUpdate",self,"showQuestItem")

 

func showQuestItem(QuestItem:String):
	if QuestItem=="broom":
		imgQuest.texture = Broom
	if QuestItem=="map":
		imgQuest.texture = Map
	if QuestItem=="storage":
		imgQuest.texture = Storage
	
	show()
	animationP.play("NewItemGot")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimationPlayer_animation_finished(_anim_name):
	hide()
