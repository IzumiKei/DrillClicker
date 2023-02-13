class_name BasicStat
extends Resource
#
# Recurso base para crear mejoras
#


export(String) var name = "Text"
export(Texture) var icon
export(int) var max_level = 1
export(int) var current_level = 1
export(Array) var upgrade_mod = [-1, 0] # Por nivel
export(Array) var upgrade_cost = [-1, 0] # Por nivel

func level_up():
	current_level += 1
	Inventory.player_stats[name] = upgrade_mod[current_level]

