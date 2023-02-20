extends StaticBody2D



func _on_Area2D_body_exited(body):
	if body.name.begins_with("Stone"):
		queue_free()
