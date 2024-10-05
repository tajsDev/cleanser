extends Node3D
@export var Player: Node3D
@export var mob_scene: PackedScene


func _ready() -> void:
	await get_tree().physics_frame 
	# Create a new instance of the Mob scene.sa
	var mob = mob_scene.instantiate()
	# Spawn the mob by adding it to the Main scene.
	add_child(mob)
	mob.set_enemy_pos(global_position)
	mob.scale = scale
	mob.set_movement_target(Player.global_position)
