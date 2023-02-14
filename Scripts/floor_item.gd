extends StaticBody2D

export (Resource) var Ore 
onready var _sprite = $Sprite

func _ready():
	_sprite.texture = Ore.ore_texture


func _on_Pickable_body_entered(body):
	if body == Inventory.player_node:
		var _item
		match Ore.ore_name:
			"Gold":
				if Inventory.gold_amount == Inventory.player_stats["MaxOre"]:
					return
				_item = "Gold"
			"Iron":
				if Inventory.iron_amount == Inventory.player_stats["MaxOre"]:
					return
				_item = "Iron"
		Inventory.update_item(_item, "Add", 1)
	queue_free()
