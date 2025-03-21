extends RigidBody3D

class_name Enemy
var speed: float
var target: Vector3
var started:= false
@onready var spawn_height:float = (self.scale.y * ($model.mesh as CapsuleMesh).height)/2

func _process(delta):
	if started:
		move_to_center(delta)

func start(p_speed:float, target:Vector3):
	speed = p_speed
	started = true

func move_to_center(delta):
	var current_pos := self.global_position
	var dir = current_pos.direction_to(target) * speed * delta
	move_and_collide(dir)

func on_hit(hitter:Node3D):
	if hitter is RayCast3D:
		queue_free()
