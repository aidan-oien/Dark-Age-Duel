extends KinematicBody2D
class_name Actor

export var gravity: = 500.0
export var max_speed: = Vector2(1000,1000)

var vel: = Vector2.ZERO

func _physics_process(delta: float) -> void:
	vel.y += gravity * delta
	if (vel.y > max_speed.y):
		vel.y = max_speed.y
	vel = move_and_slide(vel)
