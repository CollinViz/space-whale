extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal dialogue_ended
onready var name_text :=$Panel/HBoxContainer/Name
#onready var text_label :=$Panel/HBoxContainer/Panel/HBoxContainer/Text
#$Panel/HBoxContainer/Text
onready var text_label := get_node("Panel/HBoxContainer/Text") as Label
onready var NextBut = $Panel/HBoxContainer/ButtonNext
onready var FinishBut = $Panel/HBoxContainer/ButtonFinish
onready var TradBut = $Panel/HBoxContainer/ButtonTrade
onready var TradUI = $Panel/Trad
onready var TradLine1 = $Panel/Panel/Trad/TradItem1
onready var TradLine2 = $Panel/Panel/Trad/TradItem2

var dialog: Dictionary = {}
var aMessage:Array = []
var Index := 0;

var aHas2Trad :=[]
var aNeeds2Trad :=[]
# Called when the node enters the scene tree for the first time.
func _ready():
	text_label.text = "planetWantThuis asdfasdfdas"
	hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func start(planetWant):
	dialog = planetWant
	aMessage =[]
	Index=0
	for key in dialog.DialogTree:
		aMessage.append(key)
		#if str(key).begins_with("Needs":
	aHas2Trad =[]
	for key in dialog.tradFor:
		if dialog.tradFor[key]>0:
			aHas2Trad.append(key)
	
	aNeeds2Trad =[]
	for key in dialog.Needs:
		if dialog.Needs[key]>0:
			aNeeds2Trad.append(key)

	NextBut.show()
	FinishBut.hide()
	TradBut.hide()
	show()

	print(planetWant)
	text_label.text = planetWant.Text
	_showDialogOption(Index)
	name_text.text = planetWant.Name

func _showDialogOption(idx:int):
	TradUI.hide()
	var key = aMessage[idx]
	text_label.text = dialog.DialogTree[key].text
	if str(key).begins_with("Needs"):
		if PlayerData.checkPlayDataToNeeds(dialog.Needs):
			NextBut.hide()
			FinishBut.hide()
			TradBut.show()
			showTradDialog()
	if str(key).begins_with("Has"):
		FinishBut.show()
		TradBut.hide()
		NextBut.hide()
	if str(key).begins_with("Quest"):
		if PlayerData.checkPlayDataToNeeds(dialog.questNeeds):
			NextBut.hide()
			FinishBut.hide()
			TradBut.show()
			showTradQuestDialog()
	if str(key).begins_with("No"):
		FinishBut.show()
		TradBut.hide()
		NextBut.hide()
	if str(key).begins_with("Complete"):
		FinishBut.show()
		TradBut.hide()
		NextBut.hide()
	Index+=1

func showTradDialog():
	pass
	TradUI.show()
	# if aNeeds2Trad.size()-1==2:
	# 	TradLine2.show()
	# else:
	# 	TradLine2.hide()
	
	#TradLine1.setup(dialog.tradFor,dialog.Needs,aNeeds2Trad,aHas2Trad)
	 

func showTradQuestDialog():
	pass 

func _on_ButtonNext_pressed():
	if Index+1>aMessage.size()-1:
		_on_ButtonFinish_pressed()
	if Index+1==aMessage.size()-1:
		NextBut.hide()
		FinishBut.show()

	
	_showDialogOption(Index)

func _on_ButtonFinish_pressed():
	emit_signal("dialogue_ended")
	hide()


func _on_ButtonTrade_pressed():
	
	pass # Replace with function body.
