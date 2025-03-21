extends Area3D


func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body):
	if body is Enemy:
		print("💀 Player hit by enemy!")
		get_tree().quit()
