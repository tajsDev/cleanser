extends RigidBody3D

var bullet_speed = 50.0
var direction: Vector3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	direction = -transform.basis.z.normalized()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	# Manually update the position of the bullet
	transform.origin += direction * bullet_speed * delta

# Called when the bullet collides with another object or area
func _on_area_3d_area_entered(area: Area3D) -> void:
	queue_free()
