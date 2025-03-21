extends Node3D

@onready var floor := $floor as Floor
@onready var player := $Player as Player
var enemy:PackedScene =	preload("res://scenes/enemy.tscn")

@export var enemy_speed:float = 2
@export var enemy_spawn_delay:float = 5.0
var spawn_timer:Timer
var started = false

func _ready():
	spawn_timer = Timer.new()
	spawn_timer.one_shot = true
	add_child(spawn_timer)

func _process(delta):
	if spawn_timer.is_stopped():
		spawn_timer.start(enemy_spawn_delay)
		if not started:
			started = true
		else:
			var e = enemy.instantiate() as Enemy
			add_child(e)
			e.global_position = floor.random_pos()
			e.global_position.y = e.spawn_height
			e.start(enemy_speed, player.global_position)
