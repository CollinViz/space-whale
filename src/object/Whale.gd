extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func changWhale_Look(LookAt:Vector2):
	self.look_at(LookAt)
	#Horizontal flip
	if LookAt.x > position.x && $AnimatedSprite.is_flipped_h() == false:
		$AnimatedSprite.set_flip_h(false)

	elif LookAt.x < position.x && $AnimatedSprite.is_flipped_h() == true:
		$AnimatedSprite.set_flip_h(true)

	#Vertical flip
	if LookAt.y > position.y && $AnimatedSprite.is_flipped_v() == false:
		$AnimatedSprite.set_flip_v(true)

	elif LookAt.y < position.y && $AnimatedSprite.is_flipped_v() == true:
		$AnimatedSprite.set_flip_v(false)
	
	print($AnimatedSprite.is_flipped_h()," HV ",$AnimatedSprite.is_flipped_v())
	print(LookAt.x," X ",position.x)
	print(LookAt.y," Y ",position.y)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
