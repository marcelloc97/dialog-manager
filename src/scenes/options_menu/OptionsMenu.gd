extends Control


func _on_BackButton_pressed():
	var error = get_tree().change_scene_to(SceneLoader.scenes['MainMenu'])
	
	if error != OK:
		push_error("Couln't load scene MainMenu")
