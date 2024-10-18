extends Area3D
@export var bubble:MeshInstance3D 
@onready var health_mang = $HealthManager

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if(bubble != null ):
		add_child(bubble)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_entered(area: Area3D) -> void:
	_on_health_manager_hurts()


func _on_health_manager_hurts() -> void:
	if(health_mang.cur_health > 50):
		health_mang.hurt(10)
	
