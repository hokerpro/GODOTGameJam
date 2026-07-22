extends Node2D
@export var size : Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _draw():
	var screenX = DisplayServer.window_get_size().x
	var screenY = DisplayServer.window_get_size().y
	var pos = Rect2(Vector2(screenX/4, screenY/4),  size)
	draw_rect(pos, Color(0.551, 0.608, 0.253, 1.0))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
