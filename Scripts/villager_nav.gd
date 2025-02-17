extends CharacterBody3D

var player: Node3D
static var saved: int = 0 
@export var start_seconds = 4
@export var movement_speed: float = 7.0
@export var healing: int = 5
@onready var navigation_agent: NavigationAgent3D = get_node("NavigationAgent3D")
@onready var heal_timer = $Timer
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var cleansed = false

func _ready() -> void:
	await get_tree().physics_frame 
	navigation_agent.velocity_computed.connect(Callable(_on_velocity_computed))

func set_movement_target(movement_target: Vector3):
	var new_pos = Vector3(movement_target.x,global_position.y,movement_target.z)
	navigation_agent.set_target_position(new_pos)

func set_global_pos(pos: Vector3):
	global_position = pos
	

func _physics_process(delta): 
	if(player):
		set_movement_target(player.global_position)
		look_at(player.global_position)
	if(cleansed):
		set_movement_target(global_position)
		
	if not is_on_floor():
		velocity.y -= gravity * delta * movement_speed
		move_and_slide()
		velocity.y = min(velocity.y, 0)
		
	var next_path_position: Vector3 = navigation_agent.get_next_path_position()
	var new_velocity: Vector3 = global_position.direction_to(next_path_position) * movement_speed
	if navigation_agent.avoidance_enabled:
		navigation_agent.velocity = new_velocity
	else:
		_on_velocity_computed(new_velocity)

func _on_velocity_computed(safe_velocity: Vector3):
	velocity = safe_velocity
	velocity.y = min(velocity.y, 0)
	move_and_slide()
	
func healPlayer():
	heal_timer.start(start_seconds)


func _on_health_manager_dead() -> void:
	player.set_speed_boost()
	queue_free()


func _on_health_manager_gibbed() -> void:
	pass # Replace with function body.

 
func _on_timer_timeout() -> void:
	player.set_attack_boost()
	queue_free()


func _on_area_3d_changed() -> void:
	cleansed = true 
	saved+=1
	healPlayer()
