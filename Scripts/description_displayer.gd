extends NinePatchRect

export(Resource) var stat
onready var text_label = $RichTextLabel
onready var display_1 = $Control/OreDisplay
onready var display_2 = $Control/OreDisplay2

func update_description():
	pass

func _on_ExitButton_button_down():
	set_visible(false)
