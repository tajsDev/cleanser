extends Node3D

@export var grave:PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func spawn_grave() -> void:
	var irl_grave = grave.instantiate()
	irl_grave.rotation = global_rotation
	irl_grave.position = global_position
	get_tree().get_root().add_child(irl_grave)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
