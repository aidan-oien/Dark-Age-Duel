extends KinematicBody2D
class_name Actor

const FLOOR_NORMAL: = Vector2.UP

export var gravity: = 2000.0
export var max_speed: = Vector2(1000,550)
export var max_knockback_speed: = Vector2(1000,1000)
export var knockback_recovery: = 150 


var percentage:	= 0
var vel:		= Vector2.ZERO
var k_vel:		= Vector2.ZERO

func _physics_process(delta: float) -> void:

	# Knockback falloff - unfinished
	if(abs(k_vel.x) > 0):
		var k_sign = k_vel.x/abs(k_vel.x)
		k_sign -= -knockback_recovery * k_sign

	# Gravity
	vel.y += gravity * delta
	if (vel.y > max_speed.y):
		vel.y = max_speed.y
		
#	e_vel = move_and_slide(e_vel)
	
