extends Button

export(bool) var clickable = false

onready var image := $"%Image"


func _ready():
	if !clickable:
		mouse_filter = Control.MOUSE_FILTER_IGNORE
	else:
		mouse_filter = Control.MOUSE_FILTER_STOP


func set_texture_by_id(id: int):
	if id != -1:
		image.texture = Constants.CHARACTERS_IMAGES[id]

func set_texture(texture: Texture):
	image.texture = texture
