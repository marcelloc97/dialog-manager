extends Control



func _on_BackButton_pressed():
	get_node("/root/Main").remove_child(self)
