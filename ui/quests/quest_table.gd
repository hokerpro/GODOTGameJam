extends CanvasLayer
class_name QuestTable

@onready var v_box_container: VBoxContainer = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer

func addChild(child : QuestUI) -> void:
	v_box_container.add_child(child)
