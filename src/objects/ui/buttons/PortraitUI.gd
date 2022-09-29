extends Button

signal texture_changed()

export(bool) var clickable = false

onready var image := $"%Image"


func _ready():
	if !clickable:
		mouse_filter = Control.MOUSE_FILTER_IGNORE
		disabled = true
	else:
		mouse_filter = Control.MOUSE_FILTER_STOP


func set_texture_by_id(id: int):
	if id != Constants.CHARACTERS_ID.Custom:
		image.texture = Constants.CHARACTERS_IMAGES[id]
		emit_signal('texture_changed')

func set_texture(texture: Texture):
	image.texture = texture
	emit_signal('texture_changed')
