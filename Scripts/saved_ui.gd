extends Node2D
@export var s_ui:Node2D
@export var s_time:Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_saved_timer_timeout(): 
	s_ui.visible = false



func _on_player_wolf_spawn():
	s_ui.visible = true
	s_time.start()

