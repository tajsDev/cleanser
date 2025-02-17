extends Node3D
@export var f_wolf: PackedScene
var spawn_offset := Vector3(0.25, 0, 0) # Adjust the offset as needed
var spawn_count :int = 0

func _ready():
	if(spawn_count <= 0):
		return 
	for x in spawn_count:
		var new_wolf = f_wolf.instantiate()
		add_child(new_wolf)
		new_wolf.position = spawn_offset * (-1 if spawn_count % 2 else 1)
		spawn_count += 1
		
func _on_player_wolf_spawn():
	if f_wolf && spawn_count < 2:
		var new_wolf = f_wolf.instantiate()
		add_child(new_wolf)
		new_wolf.position = spawn_offset * (-1 if spawn_count % 2 else 1)
		spawn_count += 1
 
