extends Node
# Autoload
# Inventario accesible desde cualquier lado
#

signal inventory_updated
var player_stats: Dictionary = {"MaxOre": 5, "DrillSpeed": 1, "DrillPower": 1}
var iron_amount: int = 0
<<<<<<< HEAD
var gold_amount: int = 50
=======
var gold_amount: int = 40
>>>>>>> 12b2d8d277c6205447a7ac6a3e720cff1f5e6aa0
var drills_available: int = 1
var current_ore_block: StaticBody2D # Para instalar taladros (main.gd)

onready var player_node = get_tree().current_scene.find_node("Player")

func update_item(item, action):
	# Agrega un item al inventario
	if item == "Iron":
		if action == "Add":
			iron_amount += 1
		if action == "Remove":
			iron_amount -= 1
		if iron_amount >= player_stats.MaxOre:
			iron_amount = player_stats.MaxOre
	elif item == "Gold":
		if action == "Add":
			gold_amount += 1
		if action == "Remove":
			gold_amount -= 1
		if gold_amount >= player_stats.MaxOre:
			gold_amount = player_stats.MaxOre
	elif item == "Drill":
		if action == "Add":
			drills_available += 1
		if action == "Remove":
			drills_available -= 1
	emit_signal("inventory_updated") # Para los displays


