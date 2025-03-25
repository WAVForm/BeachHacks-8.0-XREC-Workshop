extends Node3D                                  # Inherits from Node3D, making this node a 3D object in the scene.

@onready var floor := $floor as Floor            # When ready, gets the child node "floor" and casts it as a Floor instance.
@onready var player := $Player as Player         # When ready, gets the child node "Player" and casts it as a Player instance.
var enemy:PackedScene = preload("res://scenes/enemy.tscn")  
# Preloads the enemy scene from the given path, storing it as a PackedScene for later instantiation.

@export var enemy_speed:float = 2               # Exports a variable "enemy_speed" with a default value of 2 for configuring enemy movement speed.
@export var enemy_spawn_delay:float = 5.0         # Exports a variable "enemy_spawn_delay" with a default value of 5.0 seconds for controlling spawn delay.
var spawn_timer:Timer                           # Declares a variable "spawn_timer" to hold a Timer node instance.
var started = false                             # Initializes a flag "started" to false, used to control initial spawn behavior.

func _ready():                                 # Called when the node is added to the scene and ready.
	spawn_timer = Timer.new()                   # Creates a new Timer instance and assigns it to spawn_timer.
	spawn_timer.one_shot = true                 # Sets the Timer to one-shot mode, meaning it will stop after one timeout.
	add_child(spawn_timer)                      # Adds the Timer as a child of the current node, so it becomes part of the scene tree.

func _process(delta):                          # Called every frame with the elapsed time since the last frame (delta).
	if spawn_timer.is_stopped():                # Checks if the spawn_timer is currently stopped.
		spawn_timer.start(enemy_spawn_delay)    # If stopped, starts the timer with the enemy_spawn_delay value.
		if not started:                         # If this is the first time the timer is running (i.e., no enemy spawned yet)...
			started = true                      # ...set the started flag to true.
		else:                                   # Otherwise, if the game has already started...
			var e = enemy.instantiate() as Enemy   # Instantiate a new enemy from the preloaded enemy scene and cast it as an Enemy.
			add_child(e)                        # Add the newly created enemy to the scene tree.
			e.global_position = floor.random_pos()  
			# Set the enemy's global position to a random position on the floor.
			e.global_position.y = e.spawn_height    
			# Adjust the enemy's y position to match its spawn height (so it appears correctly on the floor).
			e.start(enemy_speed, player.global_position)
			# Start the enemy with the defined enemy_speed and target the player's global position.
