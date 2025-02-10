extends Area3D

@export var sceneName : String
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func moveScene() -> void:
	get_tree().change_scene_to_file(sceneName)


func _on_area_entered(area: Area3D) -> void:
	if(area.is_in_group("player")):
		moveScene()
