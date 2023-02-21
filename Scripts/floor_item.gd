extends StaticBody2D

export (Resource) var Ore 
onready var _sprite = $Sprite

func _ready():
	_sprite.texture = Ore.ore_texture


func _on_Pickable_body_entered(body):
	if body.name == "Player":
		var _item = Ore.ore_name
		if Inventory.inv_slots[_item] == Inventory.player_stats["MaxOre"]:
			return
		Inventory.update_item(_item, "Add", 1)
	queue_free()
