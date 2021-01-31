extends Node

 
var current_scene = null

var current_printer = null
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func instance_node(node,location,parent:Node):
	var node_instance = node.instance()
	parent.add_child(node_instance)
	node_instance.global_position = location
	return node_instance
	


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func Event2Dialog(Name:String,DialogText:String)->Dictionary:
	var aReturn = {Name=Name,Text="This needs lots of work"}
	aReturn.DialogTree  = {}
	if DialogText!="":
		# Load Json get all Dialge data
		#/home/collin/workspace/godot/space-whale/src/event/intro1.json
		aReturn.DialogTree = load_dialogue("res://src/event/"+DialogText+".json")
		#aReturn.DialogTree =load_dialogue("res://src/Plants/1a_plantSayHello.json")

	aReturn.NeedsText = ""
	aReturn.tradForText = ""
	aReturn.questNeedsText = ""
	aReturn.questGetText = ""
	
	aReturn.Needs = {}
	aReturn.tradFor = {}
	aReturn.questNeeds = {}
	aReturn.questHas = {}

	return aReturn

func Plant2Dialog(Name:String,needs:Dictionary,has:Dictionary,QuestItemsNeeds:Dictionary,QuestItemsHas:String,DialogText:String)->Dictionary:
	var aReturn = {Name=Name,Text="This needs lots of work"}
	aReturn.DialogTree  = {}
	
	#Look what is need and give options
	 
	var aNeeds = needsText(needs)
	var aHave = haveText(has) 

	aReturn.NeedsText = aNeeds.join(",")
	aReturn.tradForText = aHave.join(",")

	var aQuestNeeds = haveText(QuestItemsNeeds) # need x Units

	aReturn.Needs = needs
	aReturn.tradFor = has
	aReturn.questNeeds = QuestItemsNeeds
	aReturn.questHas = QuestItemsHas

	aReturn.NeedsText = aNeeds.join(",")
	aReturn.tradForText = aHave.join(",")
	aReturn.questNeedsText = aQuestNeeds.join(",")
	aReturn.questGetText = QuestItemsHas


	if DialogText!="":
		# Load Json get all Dialge data
		aReturn.DialogTree = load_dialogue("res://src/Plants/"+DialogText+".json")
		for key in aReturn.DialogTree:
			if str(key).begins_with("Needs"):
				aReturn.DialogTree[key].text = str(aReturn.DialogTree[key].text).replace("{0}",aReturn.NeedsText)
			if str(key).begins_with("Has"):
				aReturn.DialogTree[key].text = str(aReturn.DialogTree[key].text).replace("{0}",aReturn.tradForText)	
			if str(key).begins_with("Quest"):
				aReturn.DialogTree[key].text = str(aReturn.DialogTree[key].text).replace("{1}",aReturn.questNeedsText)	
				aReturn.DialogTree[key].text = str(aReturn.DialogTree[key].text).replace("{0}",aReturn.questGetText)	
			if str(key).begins_with("Complete"):
				aReturn.DialogTree[key].text = str(aReturn.DialogTree[key].text).replace("{0}",aReturn.questGetText) 
		pass

	return aReturn

func needsText(needs:Dictionary)->PoolStringArray:
	var aNeeds = PoolStringArray()
	if needs.Gold>0:
		aNeeds.append(" Gold ")
	if needs.Food>0:
		aNeeds.append(" Food ")	
	if needs.Parts>0:
		aNeeds.append(" Parts ")
	if needs.Water>0:
		aNeeds.append(" Water ")
	return aNeeds

func haveText(has:Dictionary)->PoolStringArray:
	var aHave = PoolStringArray() 
	if has.Gold>0:
		aHave.append(" Gold " + str(has.Gold) + " Unit")
	if has.Food>0:
		aHave.append(" Food " + str(has.Food) + " Unit")	
	if has.Parts>0:
		aHave.append(" Parts " + str(has.Parts) + " Unit")
	if has.Water>0:
		aHave.append(" Water " + str(has.Water) + " Unit")
	return aHave

func load_dialogue(file_path) -> Dictionary:
	# Parses a JSON file and returns it as a dictionary
	var file = File.new()
	print("File getting ",file_path)
	assert(file.file_exists(file_path))

	file.open(file_path, file.READ)
	var dialogue = parse_json(file.get_as_text())
	assert(dialogue.size() > 0)
	return dialogue
