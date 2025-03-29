extends Area3D

@export var bubble: PackedScene
@onready var health_mang = $HealthManager

var bubble_on: bool = false
var bub: Node = null
var has_changed: bool = false  # prevents bubble if enemy has changed

signal changed

func _ready() -> void:
	pass

func _on_area_entered(area: Area3D) -> void:
	if area.is_in_group("projectile"):
		_on_health_manager_hurts()
	elif area.is_in_group("healing") and bubble_on:
		_remove_bubble()
		emit_signal("changed")
		has_changed = true

func _on_health_manager_hurts() -> void:
	# If the enemy has changed, simply hurt it.
	if has_changed:
		return
	
	# If enemy health is 50 or more, hurt it directly.
	if health_mang.cur_health >= 50:
		health_mang.hurt(10)
	# Otherwise, if below 50 and bubble hasn't been activated, instantiate the bubble.
	elif not bubble_on:
		bubble_on = true
		if bubble:
			bub = bubble.instantiate()
			add_child(bub)
		else:
			# Fallback if no bubble scene is provided.
			health_mang.hurt(10)

func _remove_bubble() -> void:
	if bub:
		remove_child(bub)
		bub.queue_free()
		bub = null

