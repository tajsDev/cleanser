extends Node3D
@export var cleanse_spell: PackedScene
@export var cam: Camera3D
var direction
var speed = 10.0
@export var cooldown_timer: Timer
@export var action:String

var canShoot = true 
func _physics_process(_delta):
	if Input.is_action_just_pressed(action) && canShoot:
		canShoot = false
		cooldown_timer.start()
		var spell = cleanse_spell.instantiate()
		spell.rotation = global_rotation
		spell.position = global_position
		get_tree().get_root().add_child(spell)
		spell = null
	

func _on_attack_timer_timeout() -> void:
	canShoot = true
