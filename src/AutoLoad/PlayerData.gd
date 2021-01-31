extends Node
 
signal updated
signal QuestItemUpdate (NewQuestItem)
signal died

var score: = 0 setget set_score
var deaths: = 0 setget set_deaths

var inventory ={Gold=0,Water=0,Food=0,Parts=0}
var PlanetVisited ={}
var QuestItems ={}
var QuestItems_Names ={broom="broom",map="map",storage="storage"}
var CurrentLevel := 1
var LevelsDone :={}

func reset():
	self.score = 0
	self.deaths = 0
	inventory ={Gold=0,Water=15,Food=1,Parts=0}
	PlanetVisited = {}
	QuestItems={}
	CurrentLevel = 1
	LevelsDone ={}
	emit_signal("updated")

func isFirstTimeLevel(Level) -> bool:
	return LevelsDone.has(str(Level))

func set_CurrentLevel(Level:int)->void:
	CurrentLevel = Level
	LevelsDone[str(Level)] = true

func get_Inventory(Invtype:String) -> int:
	return inventory[Invtype]

func add_Inventory(Invtype:String,NumAdd:int) -> void:
	inventory[Invtype]+=NumAdd
	emit_signal("updated")

func remove_Inventory(Invtype:String,NumAdd:int) -> void:
	if inventory[Invtype]-NumAdd>0:
		inventory[Invtype]-=NumAdd		
	else:
		inventory[Invtype] =0
	emit_signal("updated")

func set_score(new_score: int) -> void:
	score = new_score
	emit_signal("updated")


func set_deaths(new_value: int) -> void:
	deaths = new_value
	emit_signal("died")

func PlayerBeenPlanet(PlantName:String) ->bool:
	return PlanetVisited.has(PlantName)

func set_PlayerBeenPlanet(PlantName:String) ->void:
	PlanetVisited[PlantName]=PlantName

func checkQuest(QuestItemsHas:String) -> bool:
	if QuestItemsHas=="":
		return false 
	if QuestItems.has(QuestItemsHas): 
		return true
	
	return false

func add_QuestItem(QuestItem:String):
	QuestItems[QuestItem]=true
	emit_signal("QuestItemUpdate",QuestItem)

func checkPlayDataToNeeds(Needs:Dictionary)->bool:
	var bOk=false
	for key in Needs:
		if Needs[key]>0:
			if inventory[key]>=Needs[key]:
				bOk = true
			else:
				bOk = false
		
	return bOk 
