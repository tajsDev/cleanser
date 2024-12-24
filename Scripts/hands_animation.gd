extends Sprite2D

@export var attack_sprite:Texture
@export var cleanse_sprite:Texture
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if(Input.is_action_just_pressed("ui_attack")):
		texture = attack_sprite
	if(Input.is_action_just_pressed("ui_cleanse")):
		texture = cleanse_sprite
