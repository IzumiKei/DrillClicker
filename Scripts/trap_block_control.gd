extends Node
var _gas_scene = preload("res://Scenes/toxic_gas.tscn")


func _on_Toxic_stone_tree_exited():
	var _gas_instance = _gas_scene.instance()
	_gas_instance.global_position = Inventory.current_ore_block.global_position
	add_child(_gas_instance)
