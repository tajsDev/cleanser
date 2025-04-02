extends Node3D
@export var health: Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func heal_player():
	health.heal(10)

func _on_player_move_boost():
	heal_player()
	
func _on_player_wolf_spawn():
	heal_player()
