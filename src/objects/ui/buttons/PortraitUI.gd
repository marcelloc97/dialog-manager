extends Button

signal texture_changed()

export(bool) var clickable = false

onready var image := $"%Image"


func _ready():
	change_state()


func set_texture_by_id(id: int):
	if id != Constants.CHARACTERS_ID.Custom:
		image.texture = Constants.CHARACTERS_IMAGES[id]
		emit_signal('texture_changed')

func set_texture(texture: Texture):
	image.texture = texture
	emit_signal('texture_changed')

func set_clickable(state: bool):
	clickable = state
	change_state()

func change_state():
	prints('is clickable?', clickable)
	if !clickable:
		mouse_filter = Control.MOUSE_FILTER_IGNORE
		disabled = true
	else:
		yield(get_tree().create_timer(0.1), 'timeout')
		mouse_filter = Control.MOUSE_FILTER_STOP
		disabled = false
