extends StaticBody2D

export(int) var durability = 100
export(bool) var drops_ore = false
export(Resource) var ore_to_drop 
var is_minable = false

func be_mined():
	# Mina este bloque
	durability -= Pollution.resistence
	print("Durabilidad: " + String(durability))
	if durability <= 0:
		queue_free()


func drop_ore():
	var _item
	match ore_to_drop.ore_name:
		"Gold":
			_item = "Gold"
		"Iron":
			_item = "Iron"
	Inventory.update_item(_item, "Add", 1)


