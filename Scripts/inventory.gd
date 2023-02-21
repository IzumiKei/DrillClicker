extends Node
# Autoload
# Inventario accesible desde cualquier lado
#

signal inventory_updated
var player_stats: Dictionary = {"MaxOre": 1000, "DrillSpeed": 1, "MiningSpeed": 1}
var inv_slots: Dictionary = {"Iron": 0, "Gold": 0}
var iron_amount: int = 0
var gold_amount: int = 0
var drills_available: int = 1
var current_ore_block: StaticBody2D # Para instalar taladros (main.gd)


func update_item(item, action, amount):
	# Agrega un item al inventario
	if item == "Drill":
		if action == "Add":
			drills_available += amount
		if action == "Remove":
			drills_available -= amount
		emit_signal("inventory_updated")
		return
	if action == "Add":
		inv_slots[item] += amount
	if action == "Remove":
		inv_slots[item] -= amount
	if inv_slots[item] >= player_stats["MaxOre"]:
		inv_slots[item] == player_stats["MaxOre"]
	emit_signal("inventory_updated") # Para los displays

