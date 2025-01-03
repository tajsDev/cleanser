extends Label
@export var enemy : Node3D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var num_of_saved = enemy.saved
	text =  "You have saved: " + str(num_of_saved) + " enemies!"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
