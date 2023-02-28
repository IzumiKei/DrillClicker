extends Area2D



func _on_toxic_gas_body_entered(body):
	if body.name == "Player":
		for i in  5:
			body.mask -= 5
			print("i")
