extends Area3D
@onready var health_mang = $HealthManager
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func _on_area_entered(area: Area3D) -> void:
	if(area.is_in_group("enemy_proj")):
		_on_health_manager_hurts(10)
	if(area.is_in_group("dragon_proj")):
		_on_health_manager_hurts(20)
		

func _on_health_manager_hurts(damage: int) -> void:
	health_mang.hurt(damage)
