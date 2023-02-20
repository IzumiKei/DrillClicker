extends NinePatchRect


export(Resource) var stat

onready var _button = $Button
onready var _label = $Label
onready var _progress_bar = $TextureProgress


func _ready():
	# Inicializa el botón
	_label.text = stat.name
	_button.texture_normal = stat.icon
	_progress_bar.max_value = stat.max_level
	_progress_bar.value = stat.current_level


func print_cost():
	# Coloca el nuevo coste en pantalla
	if stat.current_level == stat.max_level:
		print(stat.name + " is maxed")
	else:
		print(stat.name + " costs: " + str(stat.upgrade_cost[stat.current_level]))


func _on_Button_button_down():
	if stat.current_level == stat.max_level:
		print("You have maxed out")
		_button.disabled = true
	# Ejecuta la mejora de nivel si se dispone de los materiales
	if Inventory.gold_amount >= stat.upgrade_cost[stat.current_level]:
		print(stat.name + " upgraded")
		Inventory.gold_amount -= stat.upgrade_cost[stat.current_level]
		Inventory.emit_signal("inventory_updated")
		stat.level_up()
		_progress_bar.value = stat.current_level
	else:
		print("Not Enough gold")
		
	if stat.current_level == stat.max_level:
		print("You have maxed out")
		_button.disabled = true
	
