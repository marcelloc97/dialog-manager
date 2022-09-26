extends Control

var options_menu = preload("res://src/scenes/options_menu/OptionsMenu.tscn").instance()
var edit_scene = preload("res://src/scenes/UI.tscn").instance()


func _on_OptionsButton_pressed():
	get_node("/root/Main").add_child(options_menu)

func _on_EditButton_pressed():
	get_node("/root/Main").add_child(edit_scene)
	get_node("/root/Main").remove_child(self)
