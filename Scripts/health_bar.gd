extends Control

@export var health_mang:Node3D
@onready var health_bar = $ProgressBar

func _ready():
	# Initialize the health bar.
	pass

func update_health_bar():
	var curr_health = clamp(health_mang.cur_health, 0, health_mang.max_health)
	health_bar.value = curr_health
