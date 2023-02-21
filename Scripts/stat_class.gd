class_name BasicStat
extends Resource
#
# Recurso base para crear mejoras
#


export(String) var name = "Text"
export(Texture) var icon
export(int) var max_level = 1
export(int) var current_level = 1
export(String) var upgrade_desc = "Description"
export(Array) var upgrade_mod = [-1, 0] # Por nivel
export(Array) var upgrade_cost = [[-1, -1], [0, 0]] # Por nivel
export(String, "Gold", "Iron") var first_resource = "Iron"
export(String, "Gold", "Iron") var second_resource = "Gold"
var desc_text:String

func _ready():
	update_desc_text()

func get_upgrade_cost() -> Array:
	return upgrade_cost[current_level]


func update_desc_text():
	desc_text = upgrade_desc  + str(upgrade_mod[current_level])


func level_up():
	current_level += 1
	Inventory.player_stats[name] = upgrade_mod[current_level]

