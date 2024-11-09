extends Area3D
@onready var health_mang = $HealthManager

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_entered(area: Area3D) -> void:
	if(area.is_in_group("enemy_proj")):
		print("hurts")
		_on_health_manager_hurts()


func _on_health_manager_hurts() -> void:
	health_mang.hurts(10)
