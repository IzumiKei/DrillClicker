extends StaticBody2D
#
# Nodo para los bloques de minerales
#

const MAX_ORE_SPAWN_LIMIT = 10
export(Resource) var Ore
var _floor_item_node = preload("res://Scenes/floor_item.tscn")
var being_drilled: bool = false;
var _spawned_ores = 0
onready var _sprite = $Sprite
onready var _timer = $Timer
onready var _mine_timer = $MineTimer
onready var _drill_sprite = $DrillSprite
onready var _canvas = get_tree().current_scene.get_node("UI_Control").get_node("CanvasLayer")

func _ready():
	_sprite.texture = Ore.ore_texture


func _process(_delta):
	# Controla el Timer
	if being_drilled == true and _timer.time_left == 0:
		_timer.start(Ore.mining_speed / Inventory.player_stats["DrillSpeed"])
	if _mine_timer.time_left != 0:
		_canvas.get_node("ProgressBar").value = _mine_timer.time_left


func install_drill():
	# Instala un taladro
	being_drilled = true
	_drill_sprite.visible = true


func mine_block():
	_canvas.get_node("ProgressBar").visible = true
	_mine_timer.start(5)


func spawn_ore():
	# Spawns un ore
	if _spawned_ores >= MAX_ORE_SPAWN_LIMIT:
		return
	randomize()
	var _floor_item_instance = _floor_item_node.instance()
	_floor_item_instance.Ore = Ore
	_floor_item_instance.scale.x = 0.5
	_floor_item_instance.scale.y = 0.5
	var rand_sign = randi() % 2
	if rand_sign == 0:
		#Neg
		_floor_item_instance.position.x = position.x - randi() % 8
	elif rand_sign == 1:
		#Pos
		_floor_item_instance.position.x = position.x + randi() % 8
	randomize()
	rand_sign = randi() % 2
	if rand_sign == 0:
		#Neg
		_floor_item_instance.position.y = position.y - randi() % 8
	elif rand_sign == 1:
		#Pos
		_floor_item_instance.position.y = position.y + randi() % 8
	
	get_tree().current_scene.get_node("Main").add_child(_floor_item_instance)
	_spawned_ores += 1


func _on_PlayerCheck_body_entered(body):
	if body.name == "Player":
		Inventory.current_ore_block = self # Para instalar el taladro (main.gd)
		_spawned_ores = 0


func _on_Timer_timeout():
	spawn_ore()


func _on_MineTimer_timeout():
	_canvas.get_node("ProgressBar").visible = false
	print("block mined")
	var _item
	match Ore.ore_name:
		"Gold":
			_item = "Gold"
		"Iron":
			_item = "Iron"
	Inventory.update_item(_item, "Add", 1)
