extends Node3D

signal dead
signal hurts
signal healed
signal health_changed
signal gibbed
#this works
@export var max_health = 100
@export var cur_health = 1

func _ready():
	init()

func init():
	cur_health = max_health
	emit_signal("health_changed", cur_health)

func hurt(damage: int):
	if cur_health <= 0:
		return
	cur_health -= damage
	if cur_health <= 0:
		emit_signal("dead")
	else:
		emit_signal("gibbed")
	emit_signal("health_changed")

func heal(amount: int):
	if cur_health <= 0:
		return
	cur_health += amount
	if cur_health > max_health:
		cur_health = max_health
	emit_signal("healed")
	emit_signal("health_changed")
