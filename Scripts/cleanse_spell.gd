extends RigidBody3D

var bullet_speed = 50.0
var direction: Vector3

func _ready() -> void:
	direction = -transform.basis.z.normalized()

func _physics_process(delta: float) -> void:
	transform.origin += direction * bullet_speed * delta

func _on_area_3d_area_entered(area: Area3D) -> void:
	queue_free()
