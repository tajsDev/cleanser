extends Node3D
@export var cleanse_spell: PackedScene
@export var cam: Camera3D
var direction
var speed = 10.0
func _physics_process(_delta):
	if Input.is_action_just_pressed("ui_cleanse"):
		var spell = cleanse_spell.instantiate()
		spell.global_rotation = global_rotation 
		get_tree().get_root().add_child(spell)
		spell.global_position = global_position
		spell = null
	
