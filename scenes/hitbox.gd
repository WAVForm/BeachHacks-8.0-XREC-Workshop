extends Area3D

signal player_hit

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body):
	if body.is_in_group("enemies"):
		print("💀 Player hit by enemy!")
		emit_signal("player_hit")
