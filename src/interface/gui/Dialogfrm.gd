extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal dialogue_ended
onready var name_text :=$Panel/HBoxContainer/Name
#onready var text_label :=$Panel/HBoxContainer/Panel/HBoxContainer/Text
#$Panel/HBoxContainer/Text
onready var text_label := get_node("Panel/HBoxContainer/Text") as RichTextLabel
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
	SoundController.stop_Dialog()
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
	if aMessage.size()-1==0:
		NextBut.hide()
		FinishBut.show()
		TradBut.hide()
	else:		
		NextBut.show()
		FinishBut.hide()
		TradBut.hide()
	show()

	print(planetWant)
	text_label.text = planetWant.Text
	_showDialogOption(Index)
	name_text.text = planetWant.Name

func _showDialogOption(idx:int):
	 
	SoundController.play_Dialog()
	TradUI.hide()
	var key = aMessage[idx]
	text_label.text = dialog.DialogTree[key].text
	if str(key).begins_with("Needs"):
		if PlayerData.checkPlayDataToNeeds(dialog.Needs):
			NextBut.hide()
			FinishBut.hide()
			TradBut.show()
			_showTradDialog()
	if str(key).begins_with("Has"):
		FinishBut.show()
		TradBut.hide()
		NextBut.hide()
	if str(key).begins_with("Quest"):
		TradBut.text="Close"
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

func _showTradDialog():
	var i := 0;
	$Panel/Trad/TradItem1.hide()
	$Panel/Trad/TradItem2.hide()
	for itemNeed  in aNeeds2Trad:
		if PlayerData.get_Inventory(itemNeed)>0:
			_showTradDialogGui(i,itemNeed,PlayerData.get_Inventory(itemNeed))
			i+=1
		
	TradUI.show()

func _showTradDialogGui(row:int,Resource:String,soh:int)->void:
	if row==0:
		$Panel/Trad/TradItem1.setup(Resource,soh,dialog.tradFor)
	if row==1:
		$Panel/Trad/TradItem2.setup(Resource,soh,dialog.tradFor) 

func showTradQuestDialog():
	TradBut.text="Trade"
	pass 

func _on_ButtonNext_pressed():
	if Index+1>aMessage.size()-1:
		_on_ButtonFinish_pressed()
	if Index+1==aMessage.size()-1:
		NextBut.hide()
		FinishBut.show()

	
	_showDialogOption(Index)

func _on_ButtonFinish_pressed():
	SoundController.stop_Dialog()
	emit_signal("dialogue_ended")
	hide()


func _on_ButtonTrade_pressed():
	if TradBut.text=="Trade":
		TradBut.text="Close"
		PlayerData.add_QuestItem(dialog.questHas)
		for key in dialog.questNeeds:
			PlayerData.remove_Inventory(key,dialog.questNeeds[key])
	emit_signal("dialogue_ended")
	SoundController.stop_Dialog()
	hide() 
