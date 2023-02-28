extends StaticBody2D

export(int) var durability = 100
export(bool) var drops_ore = false
export(Resource) var ore_to_drop 
var is_minable = false
var _gas_scene = preload("res://Scenes/toxic_gas.tscn")
var _gas_instance = _gas_scene.instance()
onready var parent = get_parent().add_child(_gas_instance)

func be_mined():
	# Mina este bloque
	durability -= Pollution.resistence
	print("Durabilidad: " + String(durability))
	if durability <= 0:
		queue_free()


func _on_Toxic_stone_tree_exiting():
	_gas_instance.global_position = global_position
	get_parent().call_deferred("add_child", _gas_instance)
