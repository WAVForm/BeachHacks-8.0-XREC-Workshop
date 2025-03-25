extends StaticBody3D                             # Inherits from StaticBody3D, meaning this object is non-moving and participates in collisions.

class_name Floor                               # Declares a globally accessible class named "Floor" for easy instancing.

@onready var circle := $spawn_circle as Path3D   # When the node is ready, assigns the child node "spawn_circle" (cast as Path3D) to the variable "circle".

@onready var model := $model as MeshInstance3D     # When ready, assigns the child node "model" (cast as MeshInstance3D) to the variable "model".

@onready var circle_radius = self.scale.x        # When ready, sets "circle_radius" to the x component of the node's scale, defining the radius for the spawn circle.

func random_pos() -> Vector3:                   # Defines a function "random_pos" that returns a Vector3, representing a random position.
	var pos = Vector3(randf_range(-circle_radius, circle_radius), 0, randf_range(-circle_radius, circle_radius))
	# Creates a temporary vector "pos" with a random x and z value within [-circle_radius, circle_radius] and y set to 0.
	
	var circ_pos = circle.curve.get_closest_point(pos) * circle_radius  
	# Uses the Path3D's curve to find the closest point on the path to the random position,
	# then scales it by the circle_radius to maintain the correct spawn radius.
	
	return circ_pos                             # Returns the computed position "circ_pos".
