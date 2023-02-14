extends NinePatchRect

var drill_cost = 1
onready var _label = $Label
onready var _progress_bar = $TextureProgress

func _ready():
	_label.text = "Drill"


func _on_Button_button_down():
	if Inventory.gold_amount >= drill_cost:
		print(_label.text + " buyed")
		Inventory.update_item("Drill", "Add", 1)
		Inventory.gold_amount -= drill_cost
		Inventory.emit_signal("inventory_updated")
		drill_cost *= 2
	elif Inventory.gold_amount < drill_cost:
		print("Not enough gold")
