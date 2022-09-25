extends Control

var dialog_text: String

onready var dialog_box = $'%DialogBox'
onready var text_edit := $'%TextEdit'
onready var char_select := $"%CharacterSelect"
onready var char_select_window := $"%Window"
onready var portrait := $"%Portrait"

onready var file_dialog := $"%FileDialog"

onready var credits_container := $Credits


func _on_resized():
	if char_select:
		set_char_select_window_visiblity(false)

func _on_TextEdit_text_changed() -> void:
	dialog_text = text_edit.text

func _on_Talk_pressed() -> void:
	var char_id = char_select_window.selected_character_id
	var char_name := ""
	
	if char_id == 100:
		char_name = "Custom"
	else:
		char_name = Constants.CHARACTERS[char_id].name
	
	dialog_box.set_text(char_name, dialog_text)

func _on_Clear_pressed() -> void:
	dialog_box.clear_and_close()
	text_edit.text = ''

func _on_Portrait_pressed():
	set_char_select_window_visiblity(true)

func _on_Window_popup_hide():
	var char_id = char_select_window.selected_character_id
	var char_name := ""
	
	if char_id == 100:
		char_name = "Custom"
	else:
		char_name = Constants.CHARACTERS[char_id].name
	
	set_char_select_window_visiblity(false)
	
	if dialog_text.length() >= 1:
		dialog_box.set_text(char_name, dialog_text)
	
	if char_id != 100:
		portrait.set_texture_by_id(char_select_window.selected_character_id)
	else:
		# TODO: create a slot for last selected custom avatar
		file_dialog.popup()

func _on_CreditsButton_pressed():
	credits_container.visible = true

func _on_CreditsOkButton_pressed():
	credits_container.visible = false

func _on_FileDialog_file_selected(path: String):
	var file := Image.new()
	var texture := ImageTexture.new()
	var error = file.load(path)
	
	if error == OK:
		texture.create_from_image(file)
		portrait.set_texture(texture)
		
		file_dialog.visible = false

func _ready():
	char_select.visible = false
	credits_container.visible = false
	
	for cursor in Constants.CURSORS_MAP.values():
		Input.set_custom_mouse_cursor(cursor.texture, cursor.type)


func set_char_select_window_visiblity(active):
	char_select.visible = active
	
	if active:
		char_select_window.popup()
	elif char_select_window.visible and !active:
		char_select_window.visible = false
