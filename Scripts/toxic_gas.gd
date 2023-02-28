extends Area2D



func _on_toxic_gas_body_entered(body):
	if body.name == "Player":
		body.get_node("Timer").start()
		for i in  3:
			body._healt_reduction()
			print("i")
