extends CenterContainer
var _item:=""
var _soh:int =0
var _buyButton1Text := ""
var _buyButton2Text := ""
var _buyButton1Multiply := 0.0
var _buyButton2Multiply := 0.0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	_soh =0
	pass # Replace with function body.

func setup(Resource:String,soh:int,tradFor:Dictionary)->void:
	_soh = soh
	$Control/HBoxContainer/SpinBox.value=0
	$Control/HBoxContainer/Label.text = Resource
	_item = Resource
	var idx :=0
	$Control/HBoxContainer/butBuy2.visible = false
	$Control/HBoxContainer/butBuy1.visible = false
	for key in tradFor:
		if tradFor[key]>0:
			if idx==0:
				_buyButton1Text=key
				_buyButton1Multiply = tradFor[key]
				$Control/HBoxContainer/butBuy1.visible = true
			if idx==1:
				_buyButton2Text=key
				_buyButton2Multiply = tradFor[key]
				$Control/HBoxContainer/butBuy2.visible = true
			idx+=1
	 
	show()
	_on_SpinBox_value_changed(0)
 
func _on_ButMax_pressed():
	$Control/HBoxContainer/SpinBox.value=_soh
	pass # Replace with function body.


func _on_butBuy1_pressed():
	if $Control/HBoxContainer/SpinBox.value<=0:
		return
	var butVal = $Control/HBoxContainer/SpinBox.value * _buyButton1Multiply 
	PlayerData.remove_Inventory(_item,$Control/HBoxContainer/SpinBox.value)
	PlayerData.add_Inventory(_buyButton1Text,butVal) 
	$Control/HBoxContainer/SpinBox.value =0
	_soh = PlayerData.get_Inventory(_item)

func _on_butBuy2_pressed():
	if $Control/HBoxContainer/SpinBox.value<=0:
		return
	var butVal = $Control/HBoxContainer/SpinBox.value * _buyButton2Multiply 
	PlayerData.remove_Inventory(_item,$Control/HBoxContainer/SpinBox.value)
	PlayerData.add_Inventory(_buyButton2Text,butVal) 
	$Control/HBoxContainer/SpinBox.value =0
	_soh = PlayerData.get_Inventory(_item)

func _on_SpinBox_value_changed(value):
	if( value>_soh):
		value = _soh
		$Control/HBoxContainer/SpinBox.value=_soh

	if value==0:
		$Control/HBoxContainer/butBuy1.disabled = true
		$Control/HBoxContainer/butBuy2.disabled = true
	else:
		$Control/HBoxContainer/butBuy1.disabled = false
		$Control/HBoxContainer/butBuy2.disabled = false

	var butVal = value * _buyButton1Multiply 
	$Control/HBoxContainer/butBuy1.text = _buyButton1Text + " " + str(butVal)
	butVal = value * _buyButton2Multiply 
	$Control/HBoxContainer/butBuy2.text = _buyButton2Text + " " + str(butVal)

