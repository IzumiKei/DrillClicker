extends HBoxContainer
#
# Muestra la cantidad de Oro y Hierro en pantalla
#

export(Color, RGB) var full_inventory_text_color
export(Color, RGB) var inventory_text_color
onready var _iron_display: NinePatchRect = $IronDisplay
onready var _gold_display: NinePatchRect = $GoldDisplay
onready var _drill_display: NinePatchRect = $DrillDisplay


func _ready():
	Inventory.connect("inventory_updated", self, "update_display")
	Inventory.emit_signal("inventory_updated")


func update_display():
	# Actualiza lo que se muestra
	_iron_display.get_node("RichTextLabel").text = String(Inventory.iron_amount)
	if Inventory.iron_amount == Inventory.player_stats["MaxOre"]:
		 _iron_display.get_node("RichTextLabel").set_modulate(full_inventory_text_color)
	else: 
		_iron_display.get_node("RichTextLabel").set_modulate(inventory_text_color)
	_gold_display.get_node("RichTextLabel").text = String(Inventory.gold_amount)
	if Inventory.gold_amount == Inventory.player_stats["MaxOre"]:
		 _gold_display.get_node("RichTextLabel").set_modulate(full_inventory_text_color)
	else: 
		_gold_display.get_node("RichTextLabel").set_modulate(inventory_text_color)
	_drill_display.get_node("RichTextLabel").text = String(Inventory.drills_available)
	
