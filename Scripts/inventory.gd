extends Node
# Autoload
# Inventario accesible desde cualquier lado
#

signal inventory_updated
var player_stats: Dictionary = {"MaxOre": 1000, "DrillSpeed": 1, "MiningSpeed": 1}
var iron_amount: int = 0
var gold_amount: int = 0
var drills_available: int = 1
var current_ore_block: StaticBody2D # Para instalar taladros (main.gd)

onready var player_node = get_tree().current_scene.find_node("Player")

func update_item(item, action, amount):
	# Agrega un item al inventario
	if item == "Iron":
		if action == "Add":
			iron_amount += amount
		if action == "Remove":
			iron_amount -= amount
		if iron_amount >= player_stats.MaxOre:
			iron_amount = player_stats.MaxOre
	elif item == "Gold":
		if action == "Add":
			gold_amount += amount
		if action == "Remove":
			gold_amount -= amount
		if gold_amount >= player_stats.MaxOre:
			gold_amount = player_stats.MaxOre
	elif item == "Drill":
		if action == "Add":
			drills_available += amount
		if action == "Remove":
			drills_available -= amount
	emit_signal("inventory_updated") # Para los displays


