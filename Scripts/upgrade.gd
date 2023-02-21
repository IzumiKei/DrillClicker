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


func _process(delta):
	_progress_bar.value = stat.current_level


func print_cost():
	# Coloca el nuevo coste en pantalla
	if stat.current_level == stat.max_level:
		print(stat.name + " is maxed")
	else:
		print(stat.name + " costs: " + str(stat.get_upgrade_cost()))


func _on_Button_button_down():
	get_parent().get_node("DescriptionDisplayer").stat = stat
	get_parent().get_node("DescriptionDisplayer").update_description()
	get_parent().get_node("DescriptionDisplayer").set_visible(true)
	
