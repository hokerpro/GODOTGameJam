extends CanvasLayer

@onready var v_box_container: VBoxContainer = $MarginContainer/VBoxContainer

func addTip(tip : Tip) -> void:
	v_box_container.add_child(tip)
