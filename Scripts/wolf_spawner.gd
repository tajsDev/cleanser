extends Node3D
@export var child_1: Node3D
@export var child_2: Node3D
@export var boost_timer: Timer

func _ready():
	pass
		
func _on_player_wolf_spawn():
	child_1.visible = true
	child_2.visible = true
	print(child_1.is_visible_in_tree())
	print(child_2.is_visible_in_tree())
	boost_timer.start()

func _on_boost_timer_timeout():
	child_1.visible = false
	child_2.visible = false
