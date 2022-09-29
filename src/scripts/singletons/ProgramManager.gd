extends Node

func change_scene(scene_name: String) -> bool:
	var error = get_tree().change_scene_to(SceneLoader.scenes[scene_name])
	
	if error != OK:
		push_error("Couln't load scene %s" % scene_name)
		return false
	
	return true

func set_scene_overlay(scene_name: String):
	var scene_instance = SceneLoader.scenes[scene_name].instance()
	get_tree().get_root().add_child(scene_instance)
