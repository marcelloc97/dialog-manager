extends FileDialog

signal done()

export(NodePath) var portrait_path

onready var portrait = get_node(portrait_path)


func _on_file_selected(path):
	var file := Image.new()
	var texture := ImageTexture.new()
	var error = file.load(path)
	
	if error == OK:
		texture.create_from_image(file)
		portrait.set_texture(texture)
		
		visible = false
		emit_signal('done')
