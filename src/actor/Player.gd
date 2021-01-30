extends KinematicBody2D


export (float, 0, 3200, 100) var linear_speed_max := 1600.0 setget set_linear_speed_max
export (float, 0, 10000, 100) var linear_acceleration_max := 5000.0 setget set_linear_acceleration_max
export (float, 0, 100, 0.1) var arrival_tolerance := 35.0 setget set_arrival_tolerance
export (float, 0, 500, 10) var deceleration_radius := 180.0 setget set_deceleration_radius

var agent := GSAIKinematicBody2DAgent.new(self)
var target := GSAIAgentLocation.new()
var arrive := GSAIArrive.new(agent, target)
var _accel := GSAITargetAcceleration.new()


var _velocity := Vector2()
var _drag := 0.1

func _physics_process(delta: float) -> void:
	arrive.calculate_steering(_accel)
	agent._apply_steering(_accel, delta)


func setup() -> void:
	agent.linear_speed_max = linear_speed_max
	agent.linear_acceleration_max = linear_acceleration_max
	agent.linear_drag_percentage = _drag
	arrive.deceleration_radius = deceleration_radius
	arrive.arrival_tolerance = arrival_tolerance
	target.position = agent.position


# Called when the node enters the scene tree for the first time.
func _ready():
	agent.position = GSAIUtils.to_vector3( self.position)
	setup()

# func _input(event):
# 	if event is InputEventScreenTouch:
# 		if event.pressed:
# 			movePlayer(Vector3(event.position.x, event.position.y, 0))
	
# 	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
# 		if event.pressed:
# 			movePlayer(Vector3(event.position.x, event.position.y, 0))

#func movePlayer(moveTo:Vector3):	
#	target.position = moveTo

#func _unhandled_input(event: InputEvent) -> void:#
#	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and #event.is_pressed():
#		movePlayer(Vector3(event.position.x, event.position.y, 0))

func set_linear_speed_max(value: float) -> void:
	linear_speed_max = value
	if not is_inside_tree():
		return

	agent.linear_speed_max = value


func set_linear_acceleration_max(value: float) -> void:
	linear_acceleration_max = value
	if not is_inside_tree():
		return

	agent.linear_acceleration_max = value

func set_arrival_tolerance(value: float) -> void:
	arrival_tolerance = value
	if not is_inside_tree():
		return

	arrive.arrival_tolerance = value

func set_deceleration_radius(value: float) -> void:
	deceleration_radius = value
	if not is_inside_tree():
		return

	arrive.deceleration_radius = value
