extends Control

var dialog_text: String

onready var dialog_box = $'%DialogBox'
onready var text_edit := $'%TextEdit'
onready var char_select := $"%CharacterSelect"
onready var char_select_window := $"%Window"
onready var portrait := $"%Portrait"

onready var file_dialog := $"%FileDialog"


func _on_resized():
	if char_select:
		set_char_select_window_visiblity(false)

func _on_TextEdit_text_changed() -> void:
	dialog_text = text_edit.text

func _on_Talk_pressed() -> void:
	var char_id = char_select_window.selected_character_id
	var char_name := ""
	
	if char_id == Constants.CHARACTERS_ID.Custom:
		char_name = "Custom"
	else:
		char_name = Constants.CHARACTERS[char_id].name
	
	dialog_box.set_char_name(char_name)
	dialog_box.set_text(dialog_text)

func _on_Clear_pressed() -> void:
	dialog_box.clear_and_close()
	text_edit.text = ''

func _on_Portrait_pressed():
	set_char_select_window_visiblity(true)

func _on_Portrait_texture_changed():
	var char_id = char_select_window.selected_character_id
	var char_name := ""
	
	if char_id == Constants.CHARACTERS_ID.Custom:
		char_name = "Custom"
	else:
		char_name = Constants.CHARACTERS[char_id].name
	
	dialog_box.set_char_name(char_name)

func _on_Window_popup_hide():
	set_char_select_window_visiblity(false)

func _on_OptionsButton_pressed():
	var options_scene = SceneLoader.scenes['Options'].instance()
	get_tree().get_root().add_child(options_scene)

func _on_FileDialog_popup_hide():
	set_char_select_window_visiblity(false)


func _ready():
	char_select.visible = false
	
	for cursor in Constants.CURSORS_MAP.values():
		Input.set_custom_mouse_cursor(cursor.texture, cursor.type)


func set_char_select_window_visiblity(active):
	char_select.visible = active
	
	if active:
		char_select_window.popup()
	elif char_select_window.visible and !active:
		char_select_window.visible = false
	
	portrait.set_clickable(!active)
