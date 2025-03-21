extends StaticBody3D

class_name Floor

@onready var circle:= $spawn_circle as Path3D
@onready var model := $model as MeshInstance3D
@onready var circle_radius = self.scale.x

func random_pos() -> Vector3:
	var pos = Vector3(randf_range(-circle_radius, circle_radius), 0, randf_range(-circle_radius, circle_radius))
	var circ_pos = circle.curve.get_closest_point(pos) * circle_radius
	return circ_pos
