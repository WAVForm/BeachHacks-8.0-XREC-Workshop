extends XRController3D

@onready var raycast = $RayCast3D
@onready var laser = $Laser  # Update this path if needed

func _ready():
	print("Laser node:", laser)
	laser.visible = false

func _process(delta):
	if is_button_pressed("trigger_click"):
		laser.visible = true
		if raycast.is_colliding():
			var collider = raycast.get_collider()
			if collider is Enemy:
				var hit_object = (collider as Enemy).on_hit(raycast)
	else:
		laser.visible = false
