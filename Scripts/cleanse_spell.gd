extends RigidBody3D
@export var speed = 5.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	move_and_collide(-transform.basis.z * delta * speed)


func _on_area_3d_area_entered(area: Area3D) -> void: 
	print(area)
	queue_free()
