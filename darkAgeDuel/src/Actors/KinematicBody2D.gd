extends Actor

export var player_id: = 1
export var jump_num: = 2
export var speed: = Vector2(400,-700)
var jumps_left: = jump_num
var can_jump:	= true
var on_ledge: = false
var out_of_ledge: = true
var ledge_timer: = 0.0
var can_grab_ledge: = true
var cant_move_timer: = 0.0

func _physics_process(delta: float) -> void:
	
	if(get_direction().y != 0 and on_ledge == true):
		on_ledge = false
	
	# Movement calculations
	if (!on_ledge and cant_move_timer <= 0):
		cant_move_timer = 0
		move()
	
	if (is_on_floor() or on_ledge):
		vel.y = 0
		jumps_left = jump_num
		
		# Timers
	if (cant_move_timer > 0):
		cant_move_timer -= delta
	if (ledge_timer > 0):
		ledge_timer -= delta
	



func get_direction() -> Vector2:
	return Vector2(
	Input.get_action_strength("p%s_right" % [player_id]) - Input.get_action_strength("p%s_left" % [player_id]),
	-1.0 if Input.is_action_just_pressed("p%s_down" % [player_id]) else Input.is_action_just_pressed("p%s_up" % [player_id])
	)



func move() -> void:
	var direction = get_direction()
	vel.x = speed.x * direction.x
	if (direction.y == 1  and jumps_left != 0):
		vel.y = speed.y * direction.y
		jumps_left -= 1
		
	var total_vel = vel + k_vel
	
	total_vel = move_and_slide(total_vel, FLOOR_NORMAL)



func _on_BlastZoneUnder_body_entered(body):
	get_tree().change_scene("res://src/Levels/TestLevel.tscn")

#func _on_Area2D_body_entered(body):
#	if is_on_wall():
#		vel.y = 0
#		vel.x = 0
#		gravity = 0

#func _on_Area2D_body_exited(body):
#	gravity = 2000.0

func _on_GrabHitBoxes_area_entered(area: Area2D) -> void:
	print(area.name, " entered")
	if (ledge_timer <= 0):
		on_ledge = true
		can_grab_ledge = false
		out_of_ledge = false
		jumps_left = jump_num
		if (area.name == "LeftLedge"):
			position.x = 165
			position.y = 510
		else:
			position.x = 860
			position.y = 510
		ledge_timer += 0.7
		cant_move_timer += 0.1

func _on_GrabHitBoxes_area_exited(area: Area2D) -> void:
	out_of_ledge = true
