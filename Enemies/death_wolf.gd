extends AnimatedSprite3D


func _on_health_manager_dead():
	play("bleed")

