extends NinePatchRect


export(String) var item_name
export(int) var item_cost
export(Texture) var item_icon 
onready var _label = $Label
onready var _button = $Button


func _ready():
	_label.text = item_name
	_button.texture_normal = item_icon


func _on_Button_button_down():
	# Buy the item
	if Inventory.inv_slots["Gold"] >= item_cost:
		print(_label.text + " buyed")
		Inventory.update_item("Drill", "Add", 1)
		Inventory.inv_slots["Gold"] -= item_cost
		Inventory.emit_signal("inventory_updated")
		item_cost *= 2
	elif Inventory.inv_slots["Gold"] < item_cost:
		print("Not enough gold")
