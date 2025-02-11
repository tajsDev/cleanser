extends Area3D
@export var bubble:PackedScene 
@onready var health_mang = $HealthManager
var bubble_on = false
var bub = null
signal changed
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _on_area_entered(area: Area3D) -> void:
	if(area.is_in_group("projectile")):
		_on_health_manager_hurts()
	elif (area.is_in_group("healing") && bubble_on):
		if(bub):
			remove_child(bub)
			bub = null
		emit_signal("changed")

func _on_health_manager_hurts() -> void:
	if(health_mang.cur_health > 50 ):
		health_mang.hurt(10)
	else:
		bubble_on = true
		if(bubble != null && bub == null): 
			bub = bubble.instantiate()
			add_child(bub)
		else:
			health_mang.hurt(10)
