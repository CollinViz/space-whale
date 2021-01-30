extends Node2D



# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (int) var speed = 25
export (int) var drag = 3000

export (int) var cameraTop = -500
export (int) var cameraBottom = 10000000
export (int) var cameraLeft = -500
export (int) var cameraRight = 10000000



var velocity = Vector2.ZERO

func get_input()-> Vector2:
	var move_dir = Vector2(0,0)
	velocity.x = 0
	if Input.is_action_pressed("Cam_right"):
		velocity.x += speed
		move_dir.x += 1
	if Input.is_action_pressed("Cam_left"):
		velocity.x -= speed
		move_dir.x -= 1
	if Input.is_action_pressed("Cam_up"):
		velocity.y -= speed
		move_dir.y-=1
	if Input.is_action_pressed("Cam_down"):
		velocity.y += speed
		move_dir.y+=1
	return move_dir

# Called when the node enters the scene tree for the first time.
func _ready(): 
	$Camera2D.limit_left = cameraLeft
	$Camera2D.limit_top = cameraTop
	$Camera2D.limit_bottom = cameraBottom
	$Camera2D.limit_right = cameraRight

func _physics_process(_delta):
	var _move_dir = get_input()
	$Camera2D.position += velocity
	velocity = Vector2(0,0)

func _process(_delta):
	pass
#	$Camera2D.position = get_global_mouse_position()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
