extends NinePatchRect

# PUL = per_upgrade_level
var current_level = 0
var amount_PUL = [5, 10, 15, 20, 25, 30]
var cost_PUL = [2, 5, 10, 20, 30, -1]
onready var _button = $Button
onready var _label = $Label
onready var _progress_bar = $TextureProgress


func _ready():
	_label.text = "Max Ore"


func print_cost():
	print("Max ore cost: " + str(cost_PUL[current_level]))

func _on_Button_button_down():
	if Inventory.gold_amount >= cost_PUL[current_level]:
		print("More Inventory buyed")
		Inventory.gold_amount -= cost_PUL[current_level]
		Inventory.emit_signal("inventory_updated")
		current_level += 1
		Inventory.ore_max = amount_PUL[current_level]
	else:
		print("Not Enough gold")
	if cost_PUL[current_level] == -1:
		print("You have maxed out")
		_button.disabled == true
