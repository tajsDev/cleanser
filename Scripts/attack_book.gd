extends Node3D
@export var cleanse_spell: PackedScene
var direction
var speed = 10.0
@export var cooldown_timer: Timer
@export var boost_timer : Timer
@export var action:String
var is_shotgun_mode
var canShoot = true 
func _physics_process(_delta):
	if Input.is_action_just_pressed(action) && canShoot:
		canShoot = false
		cooldown_timer.start()
		if is_shotgun_mode:
			shoot_shotgun()
		else:
			shoot_single()

func shoot_single():
	var spell = cleanse_spell.instantiate()
	spell.rotation = global_rotation
	spell.position = global_position
	get_tree().get_root().add_child(spell)

func shoot_shotgun():
	var offset_distance = 1.0 # Adjust as needed to prevent collision
	var directions = [Vector3.LEFT, Vector3.ZERO, Vector3.RIGHT] # Left, Center, Right
	
	for i in range(3): # Spawn 3 projectiles
		var spell = cleanse_spell.instantiate()
		spell.rotation = global_rotation

		# Offset position slightly to prevent immediate collision
		spell.position = global_position + (global_transform.basis * directions[i] * offset_distance)

		get_tree().get_root().add_child(spell)


func _on_attack_timer_timeout() -> void:
	canShoot = true

func _on_player_wolf_spawn():
	is_shotgun_mode = true
	boost_timer.start()


func _on_boost_timer_timeout():
	is_shotgun_mode = false
