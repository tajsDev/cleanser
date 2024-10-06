extends Node3D
@export var cleanse_spell: PackedScene

func _physics_process(_delta):
	if Input.is_action_just_pressed("ui_cleanse"):
		var spell = cleanse_spell.instantiate()
		add_child(spell)
	
