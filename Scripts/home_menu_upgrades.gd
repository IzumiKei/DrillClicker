extends NinePatchRect

export(Array) var stats_available
onready var upgrade_slot = [$Stat_Upgrade, $Stat_Upgrade2, $Stat_Upgrade3]
onready var stats_amount = stats_available.size()


func _ready():
	upgrade_slot[0].stat = stats_available[0]
	upgrade_slot[1].stat = stats_available[1]
	upgrade_slot[2].stat = stats_available[2]
	update_childs()
	

func update_childs():
	upgrade_slot[0].update_info()
	upgrade_slot[1].update_info()
	upgrade_slot[2].update_info()

func _on_Button_Down_button_down():
	pass # Replace with function body.


func _on_Button_Up_button_down():
	pass # Replace with function body.
