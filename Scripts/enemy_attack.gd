extends Node3D
@export var navigation_agent: NavigationAgent3D
@export var projectile_scene: PackedScene
@export var launch_threshold: float = 5.0
@export var projectile_speed: float = 10.0
@export var animation: AnimatedSprite3D
var canAttack = true
@export var canTimer:Timer
var isHeal = false
func _ready() -> void:
	animation.play("walk")
	
func _process(_delta: float) -> void:
	var distance_to_target = navigation_agent.distance_to_target()
	if distance_to_target <= launch_threshold && canAttack && !isHeal:
		canAttack = false
		canTimer.start()
		launch_projectile()
		
			
func launch_projectile() -> void:
		animation.play("attack")
		var spell = projectile_scene.instantiate()
		spell.rotation = global_rotation
		spell.position = global_position
		get_tree().get_root().add_child(spell)
		spell = null
	

func _on_timer_timeout() -> void:
	canAttack = true


func _on_area_3d_changed() -> void:
	animation.play("changed")
	isHeal = true
