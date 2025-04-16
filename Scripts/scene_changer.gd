extends Area3D

@export var sceneName : String
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for enemy in get_tree().get_nodes_in_group("enemies"):
		enemy.queue_free()

func moveScene() -> void:
	for enemy in get_tree().get_nodes_in_group("enemies"):
		enemy.queue_free()
	get_tree().call_deferred("change_scene_to_file", sceneName)

func _on_area_entered(area: Area3D) -> void:
	if(area.is_in_group("player")):
		moveScene()
