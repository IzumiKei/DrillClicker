extends NinePatchRect

export(Resource) var stat
var gold_icon = preload("res://Assets/Sprites/ore_gold.png")
var iron_icon = preload("res://Assets/Sprites/ore_iron.png")
onready var text_label = $RichTextLabel
onready var display_1 = $Control/OreDisplay
onready var display_2 = $Control/OreDisplay2
onready var _button = $UpgradeButton


func update_description():
	stat.update_desc_text()
	text_label.text = "Effect: \n" + stat.desc_text
	match stat.first_resource:
		"Gold":
			display_1.get_node("TextureRect").texture = gold_icon
		"Iron":
			display_1.get_node("TextureRect").texture = iron_icon
	match stat.second_resource:
		"Gold":
			display_2.get_node("TextureRect").texture = gold_icon
		"Iron":
			display_2.get_node("TextureRect").texture = iron_icon
	var _upgrade_cost = stat.get_upgrade_cost()
	display_1.get_node("RichTextLabel").text = str(_upgrade_cost[0])
	display_2.get_node("RichTextLabel").text = str(_upgrade_cost[1])
	
	if stat.current_level == stat.max_level:
		print("You have maxed out")
		_button.disabled = true
	else:
		_button.disabled = false


func _on_ExitButton_button_down():
	set_visible(false)


func _on_UpgradeButton_button_down():
	# Ejecuta la mejora de nivel si se dispone de los materiales
	var _first_resource = stat.first_resource
	var _second_resource = stat.second_resource
	var _upgrade_cost = stat.get_upgrade_cost()
	if Inventory.inv_slots[_first_resource] >= _upgrade_cost[0]:
		if Inventory.inv_slots[_second_resource] <= _upgrade_cost[1]:
			print("Not enough resources")
			return
		print(stat.name + " upgraded")
		Inventory.inv_slots[_first_resource] -= _upgrade_cost[0]
		Inventory.inv_slots[_second_resource] -= _upgrade_cost[1]
		Inventory.emit_signal("inventory_updated")
		stat.level_up()
	else:
		print("Not Enough resources")
		
	update_description()
