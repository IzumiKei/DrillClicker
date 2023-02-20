extends Node
#
# Main Script que funciona de nexo entre sus hijos y la UI
#

var _player_pos
onready var _player = $Player
onready var _ui_controler = get_parent().get_node("UI_Control")
onready var _level = $"Level 1"


func _ready():
	for child in _level.get_node("Ores").get_children():
		# Establece las conecciones de señales entre nodos y UI
		var _player_check_area = child.get_node("PlayerCheck")
		_player_check_area.connect("body_entered", _ui_controler, "player_entered_ore")
		_player_check_area.connect("body_exited", _ui_controler, "player_exited_ore")
	_level.get_node("home").get_node("PlayerCheck").connect("body_entered", _ui_controler, "player_entered_home")
	_level.get_node("home").get_node("PlayerCheck").connect("body_exited", _ui_controler, "player_exited_home")
	_player.position = _level.get_node("PlayerSpawn").position


func _physics_process(_delta):
	# Mantiene al jugador dentro de un rango predeterminado
	_player_pos = _player.position
	if _player_pos.x >= 180:
		_player.position.x = 1
	if _player_pos.x <= 0:
		_player.position.x = 179
	if _player_pos.y >= 320:
		_player.position.y = 1
	if _player_pos.y <= -320:
		_player.position.y = 319
	
	# Controla la cámara
	if _player.position.y < 160:
		_level.get_node("Camera2D").position.y = _player.position.y
	if _player.position.y > 160:
		_level.get_node("Camera2D").position.y = 160
	# Inputs
	if Input.is_action_pressed("reset_scene"):
		# Recarga la escena
		get_tree().reload_current_scene()


func _on_Drill_Button_button_down():
	# Instala un Taladro en un ore block
	if Inventory.current_ore_block.being_drilled == false:
		if Inventory.drills_available > 0:
			Inventory.current_ore_block.install_drill()
			Inventory.update_item("Drill", "Remove", 1)
		else: 
			print("No tienes ningún taladro")


func _on_Mine_Button_button_down():
	Inventory.current_ore_block.mine_block()

