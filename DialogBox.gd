extends Control

var _is_active := true

export(float, 0.1, 2.0) var transition_duration = 1.0
export(float, 0.1, 4.0) var text_duration = 2.0
export(float) var box_size = 256.0

onready var char_name_label := $'%CharNameLabel'
onready var message_label := $'%MessageLabel'
onready var tween := $Tween


# Called when the node enters the scene tree for the first time.
func _ready():
	yield(owner, 'ready')
	
	char_name_label.text = ''
	
	message_label.bbcode_text = ''
	message_label.percent_visible = 0
	
	if !_is_active:
		rect_size = Vector2(0, rect_size.y)

func _input(event: InputEvent):
	if event is InputEventKey and event.pressed:
		if event.scancode == KEY_SPACE || event.scancode == KEY_ESCAPE:
			tween.stop_all()
			message_label.percent_visible = 1


func set_text(char_name: String, text: String):
	message_label.percent_visible = 0
	message_label.bbcode_text = text#"[center]%s[/center]" % text
	
	char_name_label.text = char_name
	
#	if not _is_active:
#		_open_dialog()
#		yield(get_tree().create_timer(transition_duration), 'timeout')
#		_is_active = true
	
	_animate_label()

func clear_and_close():
	message_label.bbcode_text = ''
	char_name_label.text = ''
	
#	if _is_active:
#		_close_dialog()
#		yield(get_tree().create_timer(transition_duration), 'timeout')
#		_is_active = false

func _open_dialog():
	tween.stop_all()
	tween.interpolate_property(
		self, "rect_size", Vector2(0, rect_size.y), Vector2(box_size, rect_size.y),
		transition_duration, Tween.TRANS_CUBIC, Tween.EASE_IN_OUT
	)
	tween.start()

func _close_dialog():
	tween.stop_all()
	tween.interpolate_property(
		self, "rect_size", Vector2(box_size, rect_size.y), Vector2(0, rect_size.y),
		transition_duration, Tween.TRANS_CUBIC, Tween.EASE_IN_OUT
	)
	tween.start()

func _animate_label():
	tween.stop_all()
	tween.interpolate_property(
		message_label, "percent_visible", 0, 1,
		text_duration, Tween.TRANS_LINEAR, Tween.EASE_IN
	)
	tween.start()
