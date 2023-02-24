extends NinePatchRect


export(Array) var item_list
var current_item_index: int = 0
onready var item_slot_texture =  $item_slot/TextureRect


func _ready():
	update_shown_item(item_list[current_item_index])


func update_shown_item(item):
	item_slot_texture.texture = item.texture

func _on_RightArrowButton_button_down():
	current_item_index -= 1
	if current_item_index < 0:
		current_item_index = 0
	update_shown_item(item_list[current_item_index])


func _on_LeftArrowButton_button_down():
	current_item_index += 1
	if current_item_index >= item_list.size():
		current_item_index = item_list.size() - 1
	update_shown_item(item_list[current_item_index])


func _on_BuyButton_button_down():
	# Buys the item
	var _item = item_list[current_item_index]
	if Inventory.inv_slots["Gold"] >= _item.buy_cost:
		print(_item.name + " buyed")
		Inventory.update_item(_item.name, "Add", 1)
		Inventory.inv_slots["Gold"] -= _item.buy_cost
		Inventory.emit_signal("inventory_updated")
	elif Inventory.inv_slots["Gold"] < _item.buy_cost:
		print("Not enough gold")
