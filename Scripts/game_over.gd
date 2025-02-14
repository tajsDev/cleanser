extends Node2D
@export var d_menu : Node2D 
@export var other : Node2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_health_manager_dead():
	get_tree().paused = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	other.visible = false
	d_menu.visible = true
