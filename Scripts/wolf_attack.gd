extends RigidBody3D

var bullet_speed = 50.0
var direction: Vector3
@onready var dest_timer:Timer = $Timer

func _ready() -> void:
	dest_timer.start()
	direction = -transform.basis.z.normalized()

func _physics_process(delta: float) -> void:
	transform.origin += direction * bullet_speed * delta

func _on_area_3d_area_entered(_area: Area3D) -> void:
	queue_free()


func _on_timer_timeout() -> void:
	queue_free()
