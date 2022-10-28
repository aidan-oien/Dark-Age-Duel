extends CollisionShape2D

export var is_directional: = true	# sets if you want a direction, if not, `degree`, `constLaunch`, and `launch` will be ignored
export var degree: = 135			# degree of launch
export var const_launch: = true		# sets a constant launch power not based off of percentage, if not, `launch` will be ignored
export var launch: = -300			# how far you want to lanch if `constLaunch` is true
export var percentDelt: = 5.0		# how much percent you'd like an attack to deal

func _physics_process(delta: float) -> void:
	pass # Replace with function body.
	
