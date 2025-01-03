extends Node2D
@export var p_menu : Node2D 
@export var other : Node2D
var pause = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_paused() -> void: 
	get_tree().paused = true
	pausing()


func _on_button_pressed() -> void:
	get_tree().paused = false
	pausing()

func pausing() -> void:
	other.visible = !pause
	p_menu.visible = pause 
	if (pause):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	pause = !pause
