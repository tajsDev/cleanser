extends Node
@export var boost_ui:Node2D
@export var boost_time: Timer
@export var animation: AnimatedSprite2D

#this works
func _on_player_wolf_spawn():
	animation.play("default")
	boost_ui.visible = true
	boost_time.start()
	

func _on_boost_timer_timeout():
	boost_ui.visible = false

func _on_player_move_boost():
	boost_ui.visible = true
	boost_time.start()
