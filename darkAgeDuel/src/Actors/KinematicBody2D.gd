extends Actor


func _on_BlastZoneUnder_body_entered(body):
	get_tree().change_scene("res://src/Levels/TestLevel.tscn")


func _on_Area2D_body_entered(body):
	if is_on_wall():
		vel.y = 0
		vel.x = 0
		gravity = 0
		
	


func _on_Area2D_body_exited(body):
	gravity = 2000.0
