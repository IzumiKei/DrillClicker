extends StaticBody2D

export(int) var durability = 100
export(bool) var drops_ore = false
export(Resource) var ore_to_drop 
var is_minable = false


func be_mined():
	# Mina este bloque
	durability = durability - 20
	print("Durabilidad: " + String(durability))
	if durability <= 0:
		queue_free()
