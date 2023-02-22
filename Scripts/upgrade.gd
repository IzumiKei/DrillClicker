extends NinePatchRect


export(Resource) var stat

onready var _button = $Button
onready var _label = $Label
onready var _progress_bar = $TextureProgress
onready var _parent_menu = get_parent().get_parent()

func _process(delta):
	if stat != null:
		_progress_bar.value = stat.current_level

func update_info():
	_label.text = stat.name
	_button.texture_normal = stat.icon
	_progress_bar.max_value = stat.max_level
	_progress_bar.value = stat.current_level


func print_cost():
	# Coloca el nuevo coste en pantalla
	if stat.current_level == stat.max_level:
		print(stat.name + " is maxed")
	else:
		print(stat.name + " costs: " + str(stat.get_upgrade_cost()))


func _on_Button_button_down():
	_parent_menu.get_node("DescriptionDisplayer").stat = stat
	_parent_menu.get_node("DescriptionDisplayer").update_description()
	_parent_menu.get_node("DescriptionDisplayer").set_visible(true)
	
