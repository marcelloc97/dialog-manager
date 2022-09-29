extends WindowDialog
#warnings-disable

export(PackedScene) var character_button
export(NodePath) var portrait_path
export(NodePath) var dialog_box_path
export(NodePath) var file_window_path

export(int) var selected_character_id = 0

onready var grid := $"%GridContainer"
onready var portrait := get_node(portrait_path)
onready var dialog_box := get_node(dialog_box_path)
onready var file_window := get_node(file_window_path)


func _on_CharacterButton_selected(id: int):
	if id != Constants.CHARACTERS_ID.Custom:
		selected_character_id = id
		portrait.set_texture_by_id(id)
		
		visible = false
	else:
		file_window.popup()

func _on_files_dropped(files: PoolStringArray, _screen: int):
	var current_file: String = files[0]
	
	if visible && (current_file.ends_with('.png') or current_file.ends_with('.jpeg') or current_file.ends_with('.jpg')):
		var file := Image.new()
		var texture := ImageTexture.new()
		var error = file.load(current_file)
	
		if error == OK:
			selected_character_id = Constants.CHARACTERS_ID.Custom
			
			texture.create_from_image(file)
			portrait.set_texture(texture)
			dialog_box.set_char_name('Custom')
			
			visible = false

func _on_file_window_done():
	dialog_box.set_char_name('Custom')
	visible = false


func _ready():
	# TODO: create a slot for last selected custom avatar
	
	var custom_char = preload("res://src/objects/ui/buttons/CustomCharacterButton.tscn").instance()
	custom_char.connect("selected", self, "_on_CharacterButton_selected")
	
	get_tree().connect("files_dropped", self, '_on_files_dropped')
	file_window.connect('done', self, '_on_file_window_done')
	
	for id in Constants.CHARACTERS_ID.values():
		if id != Constants.CHARACTERS_ID.Custom:
			var character = character_button.instance()
			
			if character is CharacterButton:
				character.id = id
				character.texture = Constants.CHARACTERS[id].texture
				character.char_name = Constants.CHARACTERS[id].name
				
				character.connect("selected", self, "_on_CharacterButton_selected")
			
			grid.add_child(character)
	
	grid.add_child(custom_char)
