extends Node3D
@export var child_1: Node3D
@export var boost_timer: Timer

func _ready():
	pass
		
func _on_player_wolf_spawn():
	child_1.visible = true
	boost_timer.start()

func _on_boost_timer_timeout():
	child_1.visible = false
