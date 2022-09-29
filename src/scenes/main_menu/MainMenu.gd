extends Control
#warnings-disable

onready var credits_container := $Credits


func _on_CreditsButton_pressed():
	credits_container.visible = true

func _on_CreditsOkButton_pressed():
	credits_container.visible = false

func _on_OptionsButton_pressed():
	ProgramManager.set_scene_overlay('Options')

func _on_PlayButton_pressed():
	ProgramManager.change_scene('Play')

func _on_EditButton_pressed():
	ProgramManager.change_scene('Edit')


func _ready():
	credits_container.visible = false
