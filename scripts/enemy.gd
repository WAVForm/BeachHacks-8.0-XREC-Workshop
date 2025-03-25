extends RigidBody3D                        # This script extends the RigidBody3D class, meaning it inherits physics properties and behaviors.

class_name Enemy                         # Defines a globally accessible class named "Enemy" for easy instancing in the editor or code.

var speed: float                         # Declares a variable "speed" of type float to control movement speed.
var target: Vector3                        # Declares a variable "target" to store the destination position as a 3D vector.
var started:= false                        # Declares a boolean "started" to track whether the enemy has been activated, defaulting to false.

@onready var spawn_height:float = (self.scale.y * ($model.mesh as CapsuleMesh).height)/2  
# When the node is ready, calculates the spawn_height by multiplying the node's y-scale with the height of the CapsuleMesh from the model, then dividing by 2.
# This value is likely used to position the enemy appropriately relative to its mesh dimensions.

func _process(delta):                     # The _process function is called every frame with "delta" representing the time elapsed since the last frame.
	if started:                           # Checks if the enemy has been activated.
		move_to_center(delta)             # If activated, call the move_to_center function to update the enemy's position.

func start(p_speed:float, target:Vector3): # Defines a function "start" that takes in a speed (p_speed) and a target position.
	speed = p_speed                       # Sets the enemy's speed to the provided value.
	started = true                        # Marks the enemy as started, enabling movement in the _process function.

func move_to_center(delta):               # Defines the "move_to_center" function to move the enemy toward the target position.
	var current_pos := self.global_position  # Retrieves the current global position of the enemy.
	var dir = current_pos.direction_to(target) * speed * delta  
	# Calculates the normalized direction vector from the current position to the target, then multiplies it by speed and delta to get the step vector.
	move_and_collide(dir)                   # Moves the enemy using Godot's move_and_collide method, which moves the body and handles collisions.

func on_hit(hitter:Node3D):               # Defines the "on_hit" function to be called when the enemy is hit by something.
	if hitter is RayCast3D:                # Checks if the object that hit the enemy is a RayCast3D (likely used for detecting hits).
		queue_free()                      # If true, the enemy is removed from the scene (destroyed) by calling queue_free().
