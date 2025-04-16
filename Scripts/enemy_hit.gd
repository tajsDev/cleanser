extends Area3D

@export var bubble: PackedScene
@onready var health_mang = $HealthManager

var can_save: bool = false
var bub: Node = null
var has_changed: bool = false  

signal changed

func _ready() -> void:
	pass

func _on_area_entered(area: Area3D) -> void:
	if area.is_in_group("projectile"):
		_on_health_manager_hurts()
	elif area.is_in_group("healing") and can_save:
		if !has_changed:
			_remove_bubble()
			emit_signal("changed")
			has_changed = true

func _on_health_manager_hurts() -> void:
	if has_changed:
		return
	
	if health_mang.cur_health >= 50:
		health_mang.hurt(10)
	else:
		if bubble:
			_add_bubble()
		else:
			health_mang.hurt(10)
		can_save = true

func _add_bubble() -> void:
	if !can_save:
		bub = bubble.instantiate()
		add_child(bub)

func _remove_bubble() -> void:
	if bub:
		remove_child(bub)
		bub.queue_free()
		bub = null

