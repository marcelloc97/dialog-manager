extends Button

onready var image := $"%Image"


func set_texture_by_id(id: int):
	if id != -1:
		image.texture = Constants.CHARACTERS_IMAGES[id]

func set_texture(texture: Texture):
	image.texture = texture
