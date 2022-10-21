extends KinematicBody2D
class_name Actor

export var gravity: = 2000.0
export var max_speed: = Vector2(600,600)
export var jump_num: = 2

var vel: = Vector2.ZERO
var pos: = Vector2.ZERO
var can_jump: = true

func _physics_process(delta: float) -> void:

	if Input.is_action_pressed("p1_left"):
		pos = move_and_slide(Vector2(-400,0))
	if Input.is_action_pressed("p1_right"):
		pos = move_and_slide(Vector2(400,0))
#	if Input.is_action_just_pressed("p1_up") and can_jump and jump_num != 0:
	if Input.is_action_just_pressed("p1_up") and can_jump:
		can_jump = false
		jump_num -= 1
		vel.y = -700
	if Input.is_action_just_released("p1_up"):
		can_jump = true

	#Gravity
	vel.y += gravity * delta
	if (vel.y > max_speed.y):
		vel.y = max_speed.y
	vel = move_and_slide(vel)
	print(is_on_ceiling())
#	if (is_on_floor()):
#		jump_num = 2
