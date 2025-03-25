extends XRController3D #Spatially tracked controller with input map passthrough                 

#upon start, cast RayCast3D and Laser nodes to their respective vars
@onready var raycast = $RayCast3D 
@onready var laser = $Laser      

#Initializes the laser to be invisible on startup
func _ready():
	print("Laser node:", laser)        
	laser.visible = false              

#Every frame, the ‘trigger_click’ event is checked to set laser visible, 
#	and checks if an enemy instance is on the receiving end to call the on_hit() function.
func _process(delta):
	if is_button_pressed("trigger_click"):  #button mapping
		laser.visible = true            
		if raycast.is_colliding():       
			var collider = raycast.get_collider()  
			if collider is Enemy:     
				var hit_object = (collider as Enemy).on_hit(raycast)
				#Calls the on_hit() function on the enemy, passing the raycast as an argument, 
				#	and stores the result in hit_object.
	else:
		laser.visible = false         
