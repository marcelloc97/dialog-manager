extends Control


func _on_OptionsButton_pressed():
	var options_scene = SceneLoader.scenes['Options'].instance()
	get_tree().get_root().add_child(options_scene)

func _on_PlayButton_pressed():
	var error = get_tree().change_scene_to(SceneLoader.scenes['Play'])
	
	if error != OK:
		push_error("Couln't load scene Play")

func _on_EditButton_pressed():
	var error = get_tree().change_scene_to(SceneLoader.scenes['Edit'])
	
	if error != OK:
		push_error("Couln't load scene Edit")
