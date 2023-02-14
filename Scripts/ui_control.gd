extends Control
#
# Controlador de los elementos de UI
#

onready var _drill_button = $CanvasLayer/Drill_Button
onready var _mine_button = $CanvasLayer/Mine_Button
onready var _canvas = $CanvasLayer


func _input(_event):
	# Debug: Quita el menu de mejoras
	
	if Input.is_action_just_pressed("Mine"):
		if _drill_button.visible == true:
			Inventory.current_ore_block.spawn_ore()

func player_entered_ore(_body):
	# Señal para mostrar el boton "Drill"
	_drill_button.visible = true
	_mine_button.visible = true
	print("Player entered")


func player_exited_ore(_body):
	# Señal para ocultar el boton "Drill"
	_drill_button.visible = false
	_mine_button.visible = false
	print("Player exited")


func player_entered_home(_body):
	# Debug: Abre el menu de mejora
	_canvas.get_node("HomeMenu").visible = true
	print("Drill Cost: " + str(_canvas.get_node("HomeMenu").get_node("DrillMarket").drill_cost))
	_canvas.get_node("HomeMenu").get_node("Max Ore").print_cost()
	_canvas.get_node("HomeMenu").get_node("DrillSpeed").print_cost()


func player_exited_home(_body):
	_canvas.get_node("HomeMenu").visible = false
