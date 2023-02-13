extends StaticBody2D

var durability = 100
var is_minable = false

func _ready():
	pass


func be_mined():
	# Mina este bloque
	durability = durability - 20
	print("Durabilidad: " + String(durability))
	if durability <= 0:
		queue_free()


