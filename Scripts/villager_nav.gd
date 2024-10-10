extends CharacterBody3D

var player: Node3D
@export var movement_speed: float = 4.0
@onready var navigation_agent: NavigationAgent3D = get_node("NavigationAgent3D")
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready() -> void:
	await get_tree().physics_frame 
	navigation_agent.velocity_computed.connect(Callable(_on_velocity_computed))

func set_movement_target(movement_target: Vector3):
	navigation_agent.set_target_position(movement_target)

func set_global_pos(pos: Vector3):
	global_position = pos
	


func _physics_process(delta): 
	look_at(player.global_position)
	set_movement_target(player.global_position)
	if not is_on_floor():
		velocity.y -= gravity * delta * movement_speed

	var next_path_position: Vector3 = navigation_agent.get_next_path_position()
	var new_velocity: Vector3 = global_position.direction_to(next_path_position) * movement_speed
	if navigation_agent.avoidance_enabled:
		navigation_agent.velocity = new_velocity
	else:
		_on_velocity_computed(new_velocity)

func _on_velocity_computed(safe_velocity: Vector3):
	velocity = safe_velocity
	move_and_slide()


func _on_health_manager_dead() -> void:
	queue_free()
