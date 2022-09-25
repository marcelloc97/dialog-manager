class_name CharacterButton extends TextureButton

signal selected(id)

export(int) var id
export(Texture) var texture
export(String) var char_name

onready var name_label := $NameLabel


func _on_pressed():
	emit_signal("selected", id)


func _ready():
	texture_normal = texture
	name_label.text = char_name


func set_texture(tex: Texture):
	texture = tex
	texture_normal = tex
