extends Actor

const jump_num: = 2
export var speed: = Vector2(400,-700)
var jumps_left: = jump_num


func _physics_process(delta: float) -> void:
	var can_jump:	= true
	
	# Movement calculations
	var direction = get_direction()
	vel.x = speed.x * direction.x
	if (direction.y == 1  and jumps_left != 0):
		vel.y = speed.y * direction.y
		jumps_left -= 1
		
	var total_vel = vel + k_vel
	
	total_vel = move_and_slide(total_vel, FLOOR_NORMAL)
	
	if (is_on_floor()):
		vel.y = 1
		jumps_left = jump_num
	print(is_on_floor())

func get_direction() -> Vector2:
	return Vector2(
	Input.get_action_strength("p1_right") - Input.get_action_strength("p1_left"),
	Input.is_action_just_pressed("p1_up")
	)

func _on_BlastZoneUnder_body_entered(body):
	get_tree().change_scene("res://src/Levels/TestLevel.tscn")


func _on_Area2D_body_entered(body):
	if is_on_wall():
		vel.y = 0
		vel.x = 0
		gravity = 0
		
	


func _on_Area2D_body_exited(body):
	gravity = 2000.0
