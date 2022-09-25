extends WindowDialog

export(PackedScene) var character_button
export(int) var selected_character_id = 0

onready var grid := $"%GridContainer"


func _on_CharacterButton_selected(id: int):
	if id != -1:
		selected_character_id = id
		visible = false


func _ready():
	var custom_char = preload("res://CustomCharacterButton.tscn").instance()
	custom_char.connect("selected", self, "_on_CharacterButton_selected")
	
	for id in Constants.CHARACTERS_ID.values():
		var character = character_button.instance()
		
		if character is CharacterButton:
			character.id = id
			character.texture = Constants.CHARACTERS[id].texture
			character.char_name = Constants.CHARACTERS[id].name
			
			character.connect("selected", self, "_on_CharacterButton_selected")
		
		grid.add_child(character)
	
	grid.add_child(custom_char)
