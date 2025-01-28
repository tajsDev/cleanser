extends Node3D

@export var spawn_timer: Timer
@export var num_of_enemies: int
var children = []
@onready var barrier = $Barrier
# Function to choose a random child and activate its spawn
func choose_and_spawn_child():
	if num_of_enemies >= 0:
		# Choose a random child
		var random_child = children[randi() % children.size()]

		# Activate the selected child
		if random_child.has_method("spawn"):
			num_of_enemies -= 1
			random_child.spawn()

# Called when the node is added to the scene
func start() -> void:
	# Get all Node3D children
	for child in get_children():
		if child is Node3D:
			children.append(child)
	# Seed the random number generator
	randomize()
	spawn_timer.start()

func _on_spawner_timer_timeout() -> void:
	choose_and_spawn_child()
	if num_of_enemies >= 0:
		spawn_timer.start()
	else: 
		barrier.queue_free()
		queue_free()


func _on_area_3d_spawning() -> void:
	start()
