extends Area3D
@onready var health_mang = $HealthManager
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func _on_area_entered(area: Area3D) -> void:
	if(area.is_in_group("enemy_proj")):
		_on_health_manager_hurts()

func _on_health_manager_hurts() -> void:
	health_mang.hurt(10)

func _on_health_manager_dead() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_tree().paused = true
