extends Area3D  #inherited to enable collider detection on 3D surface                          

#Routes “body_entered” signal to trigger “_on_body_entered” func for when a body enter the area
func _ready():                          
	connect("body_entered", Callable(self, "_on_body_entered"))

#If the argument’s body is an instance of the previously defined Enemy class, then send hit message and quite the game
func _on_body_entered(body):             
	if body is Enemy:                     
		print("💀 Player hit by enemy!")  
		get_tree().quit()                 
