extends Control

@export var health_mang:Node3D
@onready var health_bar = $HealthBar

func _ready():
	# Initialize the health bar.
	update_health_bar()

func update_health_bar():
	var curr_health = clamp(health_mang.current_health, 0, health_mang.max_health)
	health_bar.value = curr_health
