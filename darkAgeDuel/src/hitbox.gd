extends CollisionShape2D

export var is_directional: = true	# sets if you want a direction, if not, `degree`, `constLaunch`, and `launch` will be ignored
export var degree: = 135			# degree of launch if is directional is true
export var const_launch: = true		# sets a constant launch power not based off of percentage
export var launch: = -300			# how far you want to lanch if `constLaunch` is true
export var percentDelt: = 5.0		# how much percent you'd like an attack to give

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
